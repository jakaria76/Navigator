

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/Bus%20Management/loginPage2.dart';
import 'package:navigator/page/User/MyLogin.dart';
import 'package:navigator/page/User/MyRegister.dart';

import 'SignUp page2.dart';

class ForgotPassword2 extends StatefulWidget {
  ForgotPassword2({Key? key}) : super(key: key);

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  String email = "";
  TextEditingController mailcontroller = new TextEditingController();

  final _formkey= GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Password Reset Email has been sent !",
            style: TextStyle(fontSize: 18.0),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 18.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Password Recovery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Enter your mail",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white70, width: 2.0),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextFormField(
                            controller: mailcontroller,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                  size: 30.0,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          margin: EdgeInsets.only(left: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email= mailcontroller.text;
                                    });
                                    resetPassword();
                                  }
                                },
                                child: Container(
                                    width: 140,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 184, 166, 6),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Send Email",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, a, b) => LogIn2(),
                                        transitionDuration: Duration(seconds: 0),
                                      ),
                                          (route) => false);
                                },
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "LogIn",
                                      style: TextStyle(fontSize: 25,color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style:
                              TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>SignUp2()));
                              },
                              child: Text("Create",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


