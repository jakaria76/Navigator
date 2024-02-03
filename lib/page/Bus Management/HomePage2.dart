import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:navigator/page/Bus%20Management/profile2.dart';
import 'package:navigator/page/bus%20and%20user%20select%20page.dart';


import '../User/pyement.dart';
import 'Feed2.dart';
import 'massage3.dart';
import 'offer2.dart';



class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _location1Controller = TextEditingController();
  final TextEditingController _location2Controller = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final List<String> suggestions = [
    "Dhaka",
    "Faridpur",
    "Gazipur",
    "Gopalganj",
    "Jamalpur",
    "Kishoreganj",
    "Madaripur",
    "Manikganj",
    "Munshiganj",
    "Mymensingh",
    "Narayanganj",
    "Narsingdi",
    "Netrokona",
    "Rajbari",
    "Shariatpur",
    "Sherpur",
    "Tangail",
    "Bogra",
    "Joypurhat",
    "Naogaon",
    "Natore",
    "Nawabganj",
    "Pabna",
    "Rajshahi",
    "Sirajgonj",
    "Dinajpur",
    "Gaibandha",
    "Kurigram",
    "Lalmonirhat",
    "Nilphamari",
    "Panchagarh",
    "Rangpur"
        "Thakurgaon",
    "Barguna",
    "Barisal",
    "Bhola",
    "Jhalokati",
    "Patuakhali",
    "Pirojpur",
    "Bandarban",
    "Brahmanbaria",
    "Chandpur",
    "Chittagong",
    "Comilla",
    "Cox's Bazar",
    "Feni",
    "Khagrachari",
    "Lakshmipur",
    "Noakhali",
    "Rangamati",
    "Habiganj",
    "Maulvibazar",
    "Sunamganj",
    "Sylhet",
    "Bagerhat",
    "Chuadanga",
    "Jessore",
    "Jhenaidah",
    "Khulna",
    "Kushtia",
    "Magura",
    "Meherpur",
    "Narail",
    "Satkhira",
  ];

  List<Widget> busCards = [];

  Widget _createBusCard(String busName, String location1, String location2, String price, String date) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.orange,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bus Name: $busName'),
            Text('Location 1: $location1'),
            Text('Location 2: $location2'),
            Text('Price: $price'),
            Text('Date: $date'),
            ElevatedButton(
              onPressed: () {

                _saveDataToFirestore(busName, location1, location2, price, date);

                setState(() {
                  busCards.removeLast();
                });
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _saveDataToFirestore(String busName, String location1, String location2, String price, String date) async {
    try {

      FirebaseFirestore firestore = FirebaseFirestore.instance;


      CollectionReference busInfoCollection = firestore.collection('bus_info');


      await busInfoCollection.add({
        'bus_name': busName,
        'location1': location1,
        'location2': location2,
        'price': price,
        'date': date,
      });

      print('Data saved successfully!');
    } catch (e) {
      print('Error saving data: $e');

    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
    );

    if (selectedDate != null) {
      _dateController.text = selectedDate.toLocal().toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.blueGrey[700],
    child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    automaticallyImplyLeading: false,
    title: Center(child: Text('Bus Management')),
    backgroundColor: Colors.blueAccent,
    elevation: 0,
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
      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.orange),
                  accountName: Text('Navigator',style: TextStyle(color: Colors.deepOrange,fontSize: 47,),),
                  accountEmail: Text("navigatorofficial@gmail.com"),

                  
                ),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text("chat"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen6()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bus_user()));
                },
              ),

            ],
          )
      ),

      body: Container(
        color: Colors.blueGrey[700],
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _busNameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.bus_alert_rounded,color: Colors.blue,size: 40,),
                  labelText: 'Bus Name',labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _location1Controller,

                  decoration: InputDecoration(
                      icon: Icon(Icons.location_on,color: Colors.blue,size: 40,),
                      labelText: 'From',labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return suggestions
                      .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _location1Controller.text = suggestion;
                },
              ),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _location2Controller,

                  decoration: InputDecoration(
                      icon: Icon(Icons.location_city,color: Colors.blue,size: 40,),
                      labelText: 'To',labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return suggestions
                      .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _location2Controller.text = suggestion;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on_sharp,color: Colors.blue,size: 40,),
                  labelText: 'Price',labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,

                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_month,color: Colors.blue,size: 40,),
                  labelText: 'Select Date',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Create a card with entered data and add it to the list
                  Widget card = _createBusCard(
                    _busNameController.text,
                    _location1Controller.text,
                    _location2Controller.text,
                    _priceController.text,
                    _dateController.text,
                  );
                  setState(() {
                    busCards.add(card);
                  });
                },
                child: Center(child: Text('Add Bus Information')),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: busCards,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
