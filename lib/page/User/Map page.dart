import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            LocationCard(
              locationName: 'Park A',
              description: 'A beautiful park with greenery.',
              imageUrl: 'assets/park_a.jpg',
              distance: '2.5 miles',
              rating: 4.5,
            ),
            LocationCard(
              locationName: 'Museum B',
              description: 'Explore historical artifacts.',
              imageUrl: 'assets/museum_b.jpg',
              distance: '5.0 miles',
              rating: 3.8,
            ),
            // Add more LocationCards as needed
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String locationName;
  final String description;
  final String imageUrl;
  final String distance;
  final double rating;

  LocationCard({
    required this.locationName,
    required this.description,
    required this.imageUrl,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(description),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 4.0),
                        Text(distance),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 4.0),
                        Text(rating.toString()),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your custom button functionality here
                      },
                      icon: Icon(Icons.info),
                      label: Text('Details'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add your custom button functionality here
                      },
                      icon: Icon(Icons.map),
                      label: Text('Navigate'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
