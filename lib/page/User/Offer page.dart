import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://image.lexica.art/full_webp/d85539dc-0c08-4d8f-961e-9164f485a58c',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Offer Content wrapped in SingleChildScrollView
          SingleChildScrollView(
            child: Container(
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

                  // Offer Cards (You can replace this with your actual data)
                  OfferCard(
                    cardTitle: 'Weekend Special',
                    offers: [
                      OfferItem(title: '10% Off on Weekend Trips', description: 'Use code: WEEKEND10'),
                      OfferItem(title: 'Double Points on Every Booking', description: 'Limited Time Offer'),
                    ],
                  ),
                  OfferCard(
                    cardTitle: 'Monthly Bonanza',
                    offers: [
                      OfferItem(title: '20% Off on Monthly Subscriptions', description: 'Use code: MONTHLY20'),
                      OfferItem(title: 'Triple Points on First Booking', description: 'New Users Only'),
                    ],
                  ),

                  // Add more OfferCards as needed
                  OfferCard(
                    cardTitle: 'Special Event Sale',
                    offers: [
                      OfferItem(title: 'Free Upgrade on Event Packages', description: 'Upgrade Now!'),
                      OfferItem(title: 'Extra 15% Off on VIP Tickets', description: 'Use code: VIP15'),
                    ],
                  ),
                  OfferCard(
                    cardTitle: 'Holiday Deals',
                    offers: [
                      OfferItem(title: 'Holiday Package Discount', description: 'Limited Availability'),
                      OfferItem(title: 'Early Booking Bonus', description: 'Book now and save!'),
                    ],
                  ),

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
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String cardTitle;
  final List<OfferItem> offers;

  OfferCard({required this.cardTitle, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cardTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          // Offer List
          Column(
            children: offers,
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
