import 'package:flutter/material.dart';

void main() {
  runApp(BkashPaymentApp());
}

class BkashPaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bKash Payment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bKash Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentScreen()),
            );
          },
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _recipientNumber = '';
  double _amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _recipientNumber = value;
                });
              },
              decoration: InputDecoration(labelText: 'Recipient Number'),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _amount = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(
                      recipientNumber: _recipientNumber,
                      amount: _amount,
                    ),
                  ),
                );
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  final String recipientNumber;
  final double amount;

  ConfirmationScreen({required this.recipientNumber, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recipient Number: $recipientNumber'),
            SizedBox(height: 10.0),
            Text('Amount: $amount'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Complete payment logic can be added here
              },
              child: Text('Complete Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
