import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketDetails extends StatefulWidget {
  const TicketDetails({super.key});

  @override
  State<TicketDetails> createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicketDetails"),
      ),
    );
  }
}
