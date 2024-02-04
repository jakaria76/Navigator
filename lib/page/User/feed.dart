import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigator/page/User/profile%20page.dart';

import 'HomePage.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[700],
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,size: 40,), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.feed,color: Colors.blue,size: 40,), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,size: 40,), label: "Profile"),


        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
          }
          if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
          }
        },
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

