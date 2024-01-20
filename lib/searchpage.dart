import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchTextField(),
            SizedBox(height: 20),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Enter your search query',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: _performSearch,
        ),
      ),
    );
  }

  void _performSearch() {
    String query = _searchController.text.trim().toLowerCase();
    // Perform your search logic here (e.g., search in a database, API call)
    // For this example, we'll simulate some search results.
    List<String> mockSearchResults = List.generate(5, (index) => 'Result $index');
    setState(() {
      _searchResults = mockSearchResults;
    });
  }

  Widget _buildSearchResults() {
    return Expanded(
      child: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_searchResults[index]),
            // You can customize the appearance of each search result item
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
