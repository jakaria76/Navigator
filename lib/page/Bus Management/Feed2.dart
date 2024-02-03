import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Feed2 extends StatefulWidget {
  const Feed2({super.key});

  @override
  State<Feed2> createState() => _Feed2State();
}

class _Feed2State extends State<Feed2> {
  int _value = 1;
  @override
  void initState() {
    super.initState();
    _value = 1; // Set an initial value
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/feed.jpeg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(child: Text('Feed')),
          ),
          body: PropertyList(),




        )
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


      child: Container(
        height: 150,

        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/feed.jpeg"),fit: BoxFit.cover,
            )
          //image: DecorationImage(
          //image: AssetImage("images/sky.jpg"),
          //fit: BoxFit.cover,

        ),
        child: ListTile(
          title: Text('Bus_name: ${property['bus_name']}',style: TextStyle(color: Colors.white),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${property['location1']}',style: TextStyle(color: Colors.white),),
              Text('To: ${property['location2']}',style: TextStyle(color: Colors.white),),
              Text('Price: ${property['price']}',style: TextStyle(color: Colors.white),),
              Text('Date: ${property['date']}',style: TextStyle(color: Colors.white),),
              // Check if 'price' field exists before accessing its value
              //if (data?.containsKey('price') ?? false) Text('Price: ${property['price']}'),
              // Check if 'district' field exists before accessing its value
              //if (data?.containsKey('date') ?? false) Text('Date: ${property['date']}'),



            ],
          ),
        ),
      ),
    );
  }
}

