// Add this import for a smooth transition animation
import 'package:flutter/cupertino.dart';

class ForgotPassword2 extends StatefulWidget {
  ForgotPassword2({Key? key}) : super(key: key);

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // ... existing code ...
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add a cool-looking button with a ripple effect
                      CupertinoButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                            });
                            resetPassword();
                          }
                        },
                        color: Color.fromARGB(255, 184, 166, 6),
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Send Email",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      // Make the login text more appealing
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => LogIn2(),
                              transitionDuration: Duration(seconds: 1),
                            ),
                                (route) => false,
                          );
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ... existing code ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
g