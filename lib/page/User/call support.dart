import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class callsupport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Support page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/callsupport.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}