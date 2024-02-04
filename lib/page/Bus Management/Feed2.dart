import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigator/page/Bus%20Management/profile2.dart';

import 'HomePage2.dart';

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
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(child: Text('Feed')),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey[800],
            items: [

              BottomNavigationBarItem(icon: Icon(Icons.feed,color: Colors.blue,size: 40,),label:"feed"),
              BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.blue,size: 40,),label:"add"),
              BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,size: 40,),label:"profile"),


            ],
            onTap: (int index){

              if(index==0)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Feed2()));
              }
              if(index==1)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2()));
              }
              if(index==2)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>profile2()));
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


        height: 200,

        color: Colors.blueGrey[700],
        child: ListTile(
          title: Text('Bus_name: ${property['bus_name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text('From: ${property['location1']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              Text('To: ${property['location2']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              Text('Price: ${property['price']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              Text('Date: ${property['date']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
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

