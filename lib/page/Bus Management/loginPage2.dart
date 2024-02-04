// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/Bus%20Management/HomePage2.dart';
import 'package:navigator/page/User/HomePage.dart';
import 'package:navigator/page/User/MyRegister.dart';

import 'ForgatePassword2.dart';
import 'SignUp page2.dart';



class LogIn2 extends StatefulWidget {
  const LogIn2({Key? key}) : super(key: key);

  @override
  State<LogIn2> createState() => _LogIn2State();
}

class _LogIn2State extends State<LogIn2> {
  String email = "", password = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "No User Found for that Email",
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF4c59a5),
                        borderRadius: BorderRadius.circular(22)),
                    child: TextFormField(
                      controller: useremailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter E-Mail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter BusManagement E-mail',
                          hintStyle: TextStyle(color: Colors.white60)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF4c59a5),
                        borderRadius: BorderRadius.circular(22)),
                    child: TextFormField(
                      controller: userpasswordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white60)),
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword2()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 24.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = useremailcontroller.text;
                          password = userpasswordcontroller.text;
                        });
                      }
                      userLogin();
                    },
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 55,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFFf95f3b),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User?",
                        style: TextStyle(color: Colors.white, fontSize: 30.0),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp2()));
                        },
                        child: Text(
                          " Signup",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
