import 'package:flutter/material.dart';
import 'package:navigator/page/User/pyement/verify.dart';

class number extends StatefulWidget {
  const number({super.key});

  @override
  State<number> createState() => _numberState();
}

class _numberState extends State<number> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/numberB.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        body:  Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 459, left: 200, right: 0),
                child: Center(
                  child: Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>verify()));
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
