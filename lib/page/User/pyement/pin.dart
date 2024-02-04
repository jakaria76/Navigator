import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/User/pyement/pyementcomplete.dart';

import '../HomePage.dart';
import '../feed.dart';
import '../profile page.dart';

class pin extends StatefulWidget {
  const pin({super.key});

  @override
  State<pin> createState() => _pinState();
}

class _pinState extends State<pin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/number.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueGrey[700],
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,size: 40,), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.feed,color: Colors.blue,size: 40,), label: "Feed"),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,size: 40,), label: "Profile"),


          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
            }
            if (index == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
            }
          },
        ),
        body: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 447, left: 180, right: 7),
              child: Center(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>pyementcomplete()));
                    },
                      child: Container(

                          child: Text('Confrom number',style: TextStyle(fontWeight: FontWeight.w800,),)),
                    )

                  ],
                ),
              ),
            ),


          ],

        ),
      ),
    );
  }
}
