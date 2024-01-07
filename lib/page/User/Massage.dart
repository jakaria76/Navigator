import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class massage extends StatefulWidget {
  const massage({super.key});

  @override
  State<massage> createState() => _massageState();
}

class _massageState extends State<massage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
    );
  }
}
