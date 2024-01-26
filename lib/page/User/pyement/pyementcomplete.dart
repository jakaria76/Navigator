import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pyementcomplete extends StatefulWidget {
  const pyementcomplete({super.key});

  @override
  State<pyementcomplete> createState() => _pyementcompleteState();
}

class _pyementcompleteState extends State<pyementcomplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pyement complete'),
      ),
      body: Center(
        child: Row(
          children: [
            Text("pyement successful"),
          ],
        ),
      ),
    );
  }
}
