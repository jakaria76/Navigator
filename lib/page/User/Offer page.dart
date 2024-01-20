import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Offers'),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://image.lexica.art/full_webp/d85539dc-0c08-4d8f-961e-9164f485a58c',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Offer Content
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8), // Adjust opacity as needed
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Offers',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Offer List (You can replace this with your actual data)
                OfferItem(title: '10% Off on Weekend Trips', description: 'Use code: WEEKEND10'),
                OfferItem(title: 'Double Points on Every Booking', description: 'Limited Time Offer'),

                SizedBox(height: 20),

                // User's Reward Points
                Text(
                  'Your Reward Points: 150', // Replace with actual user points
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final String title;
  final String description;

  OfferItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OfferPage(),
  ));
}
