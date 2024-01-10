import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile2 extends StatefulWidget {
  const profile2({super.key});

  @override
  State<profile2> createState() => _profile2State();
}

class _profile2State extends State<profile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
    );
  }
}
