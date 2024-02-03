import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'TicketDetails.dart';

class PassengerDetails extends StatefulWidget {
  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Passenger Details'),
    centerTitle: true,
    backgroundColor: Colors.teal,
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextField(
    controller: nameController,
    decoration: InputDecoration(
    labelText: 'Enter Full Name',
    prefixIcon: Icon(Icons.person),
    ),
    ),
    SizedBox(height: 16),
    TextField(
    controller: genderController,
    decoration: InputDecoration(
    labelText: 'Gender',
    prefixIcon: Icon(Icons.face),
    ),
    ),
    ],
    ),
    ),
    ),
    SizedBox(height: 16),
    Card(
    elevation: 8.0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextField(
    controller: emailController,
    decoration: InputDecoration(
    labelText: '
