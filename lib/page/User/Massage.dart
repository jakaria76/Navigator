import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchedName = '';
  bool _showCard = false;
  Map<String, dynamic>? _userData;

  void _searchUser() async {
    String searchedName = _searchController.text.trim();

    // TODO: Replace 'your_collection' with the actual collection name in your Firebase Firestore.
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('your_collection')
        .where('username', isEqualTo: searchedName)
        .limit(1) // Limit the result to 1 since username should be unique
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        _showCard = true;
        _userData = querySnapshot.docs.first.data();
      });
    } else {
      setState(() {
        _showCard = false;
        _userData = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase User Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(labelText: 'Enter username'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchUser,
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            _showCard
                ? Card(
              color: Colors.green,
              child: ListTile(
                title: Text('Username: ${_userData?['username']}'),
                // Add other details from the user if needed
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
