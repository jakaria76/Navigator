import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bus Management/loginPage2.dart';
import 'User/MyLogin.dart';

class bus_user extends StatefulWidget {
  const bus_user({super.key});

  @override
  State<bus_user> createState() => _bus_userState();
}

class _bus_userState extends State<bus_user> {
  @override
  Widget build(BuildContext context) {
    final action = CupertinoActionSheet(

      message: Text("Select The Item",style: TextStyle(fontSize: 20),),
      actions: [
        CupertinoActionSheetAction(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn()));
        },
            child: Text("User",style: TextStyle(fontSize: 30),)
        ),
        CupertinoActionSheetAction(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LogIn2()));
        },
            child: Text("Bus Management",style: TextStyle(fontSize: 30),)
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("cencel",style: TextStyle(color: Colors.red),),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bus_user.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),


        body:Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            SizedBox(
              height: 700,
            ),
            Container(
              // Wrap SizedBox with Container to provide width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Select your item',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 30,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(context: context, builder: (context)=>action);
              },
              child: Text(
                "Click",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize:30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ),
    );
  }
}
