import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import the cloud_firestore package

import 'Ticket Details.dart';

class passenger_details extends StatefulWidget {
  @override
  _passenger_detailsState createState() => _passenger_detailsState();
}

class _passenger_detailsState extends State<passenger_details> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Initialize Firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Passenger Details')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(labelText: 'Enter Full Name'),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: genderController,
                        decoration: InputDecoration(labelText: 'Gender'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email, size: 30,),
                          labelText: 'Email Id', labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.phone, size: 30,
                            ),
                            labelText: 'Phone'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Store data in Firebase
                  await firestore.collection('PassengerDetails').add({
                    'name': nameController.text,
                    'gender': genderController.text,
                    'email': emailController.text,
                    'phone': phoneController.text,
                  });

                  Navigator.push(context, MaterialPageRoute(builder: (context) => TicketDetails()));

                  setState(() {
                    nameController.clear();
                    genderController.clear();
                    emailController.clear();
                    phoneController.clear();
                  });
                },
                child: Text('Continue Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
