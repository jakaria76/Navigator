import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/User/pyement/pin.dart';

class verify extends StatefulWidget {
  const verify({super.key});

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/verifyB.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 449, left: 180, right: 7),
                child: Center(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>pin()));
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
      ),
    );
  }
}
