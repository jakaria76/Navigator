import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigator/page/User/seat%20booking%20page.dart';

class SearchResult extends StatefulWidget {
  final String searchLocation1;
  final String searchLocation2;
  final String searchDate;

  SearchResult({
    required this.searchLocation1,
    required this.searchLocation2,
    required this.searchDate,
  });

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Container(
        color: Colors.blueGrey[700],
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('bus_info').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            List<Widget> searchResults = [];

            snapshot.data!.docs.forEach((doc) {
              var busName = doc['bus_name'];
              var location1 = doc['location1'];
              var location2 = doc['location2'];
              var date = doc['date'];
              var price = doc['price'];

              if (location1 == widget.searchLocation1 &&
                  location2 == widget.searchLocation2 &&
                  date == widget.searchDate) {
                searchResults.add(
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });

                        // Perform any async operation here

                        // Simulating a delay with Future.delayed
                        await Future.delayed(Duration(seconds: 3));

                        setState(() {
                          isLoading = false;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => seatbooking()),
                        );
                      },
                      child: Card(
                        shadowColor: Colors.black,

                        margin: EdgeInsets.symmetric(vertical: 2,horizontal: 5,),
                        color: Colors.teal,

                        child: Padding(

                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text('Bus Name: $busName',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                              Text('Location 1: $location1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              Text('Location 2: $location2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              Text('Date: $date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              Text('Price: $price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            });

            return isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView(
              children: searchResults,
            );
          },
        ),
      ),
    );
  }
}
