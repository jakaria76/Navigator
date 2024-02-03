import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/User/pyement/pyementcomplete.dart';

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
