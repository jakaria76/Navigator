import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigator/page/User/seat%20booking%20page.dart';

class SearchResult extends StatelessWidget {
  final String searchLocation1;
  final String searchLocation2;
  final String searchDate;


  SearchResult({
    required this.searchLocation1,
    required this.searchLocation2,
    required this.searchDate,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://image.lexica.art/full_webp/cd9bb2f5-0747-4a8c-a27c-d6ec1fddc873'),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('bus_info').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            List<Widget> searchResults = [];

            snapshot.data!.docs.forEach((doc) {
              var busName = doc['bus_name'];
              var location1 = doc['location1'];
              var location2 = doc['location2'];
              var date = doc['date'];
              var price = doc['price'];

              if (location1 == searchLocation1 &&
                  location2 == searchLocation2 &&
                  date == searchDate) {
                searchResults.add(
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => seatbooking()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://wallpaperfx.com/uploads/wallpapers/2015/04/26/16393/preview_city-rain.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 1),
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bus Name: $busName',
                                      style: TextStyle(color: Colors.white)),
                                  Text('Location 1: $location1',
                                      style: TextStyle(color: Colors.white)),
                                  Text('Location 2: $location2',
                                      style: TextStyle(color: Colors.white)),
                                  Text('Date: $date',
                                      style: TextStyle(color: Colors.white)),
                                  Text('Price: $price',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )


                    ),
                  ),
                );
              }
            });

            return ListView(
              children: searchResults,
            );
          },
        ),
      ),
    );
  }
}



