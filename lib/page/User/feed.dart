import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _value = 1;
  @override
  void initState() {
    super.initState();
    _value = 1; // Set an initial value
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Feed')),
      ),
      body: PropertyList(),




    );
  }
}
class PropertyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('bus_info').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading..."),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var property = snapshot.data!.docs[index];
            return PropertyCard(property: property);
          },
        );
      },
    );
  }
}
class PropertyCard extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    // Cast property.data() to Map<String, dynamic>?
    final Map<String, dynamic>? data = property.data() as Map<String, dynamic>?;

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Bus_name: ${property['bus_name']}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${property['location1']}'),
            Text('To: ${property['location2']}'),
            Text('Price: ${property['price']}'),
            Text('Date: ${property['date']}'),
            // Check if 'price' field exists before accessing its value
            //if (data?.containsKey('price') ?? false) Text('Price: ${property['price']}'),
            // Check if 'district' field exists before accessing its value
            //if (data?.containsKey('date') ?? false) Text('Date: ${property['date']}'),



          ],
        ),
      ),
    );
  }
}

