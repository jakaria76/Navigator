import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class passenger_details extends StatefulWidget {
  const passenger_details({super.key});

  @override
  State<passenger_details> createState() => _passenger_detailsState();
}

class _passenger_detailsState extends State<passenger_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passenger Details"),
      ),
    );
  }
}
