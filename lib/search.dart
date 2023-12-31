import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<bool> selectedSeats = List.generate(24, (index) => false);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Seat Booking'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: selectedSeats.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => bookSeat(index + 1),
            child: Container(
              margin: EdgeInsets.all(8),
              color: selectedSeats[index] ? Colors.red : Colors.green,
              child: Center(
                child: Text(
                  'Seat ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void bookSeat(int seatNumber) async {
    if (!selectedSeats[seatNumber - 1]) {
      // Seat is not booked, allow booking
      await _firestore.collection('bookings').add({
        'seatNumber': seatNumber,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        selectedSeats[seatNumber - 1] = true;
      });
    } else {
      // Seat is already booked, show a message or handle accordingly
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Seat Already Booked'),
            content: Text('The selected seat is already booked.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}



