
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:navigator/page/User/feed.dart';

import 'package:navigator/page/User/profile%20page.dart';
import 'package:navigator/page/User/Search Result.dart';
import 'package:navigator/page/User/pyement.dart';
import 'package:navigator/page/User/setting%20page.dart';

import '../bus and user select page.dart';

import 'Bus Alart.dart';
import 'History.dart';
import 'HomeScreen.dart';

import 'Offer page.dart';
import 'call support.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize EasyLoading
    EasyLoading.init();

    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[700],
          title: Center(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text(
                  'Navigator',
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.bus_alert), text: "Bus alert"),
              Tab(icon: Icon(Icons.message), text: "Message "),
              Tab(icon: Icon(Icons.history), text: "hsitory"),
              Tab(icon: Icon(Icons.discount), text: "Offers"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    'Navigator',
                    style: TextStyle(color: Colors.black, fontSize: 47),
                  ),
                  accountEmail: Text("navigatorofficial@gmail.com"),
                  onDetailsPressed: () {},
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("Call Support"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => callsupport()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Bus Alert"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BkashPaymentApp()));
                },
              ),
              ListTile(
                leading: Icon(Icons.discount),
                title: Text("Offers"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselSliderDemo()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => bus_user()));
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeContent(),
            noti(),
            HomeScreen5(),
            HistoryPage(),
            CarouselSliderDemo(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final TextEditingController _searchLocation1Controller = TextEditingController();
  final TextEditingController _searchLocation2Controller = TextEditingController();
  final TextEditingController _searchDateController = TextEditingController();
  int _currentIndex = 0;
  final List<String> images = [
    'images/hanif1.jpeg',
    'images/ena2.jpeg',
    'images/ena1.jpeg',
    'images/green1.jpeg',
    'images/hanif2.jpeg',
    'images/samoli1.jpg',
    'images/selfi1.jpeg',
  ];
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





  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[700],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [


              Padding(
                padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
                child: Card(
                  color: Colors.blueGrey[700],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _searchLocation1Controller,
                          decoration: InputDecoration(
                              icon: Icon(Icons.location_on, size: 50, color: Colors.white),
                              labelText: 'From Where',
                              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                        ),
                        suggestionsCallback: (pattern) async {
                          return suggestions
                              .where((item) => item.toLowerCase().contains(pattern.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion, selectionColor: Colors.white),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _searchLocation1Controller.text = suggestion;
                        },
                      ),
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _searchLocation2Controller,
                          decoration: InputDecoration(
                              icon: Icon(Icons.location_city, size: 50, color: Colors.white),
                              labelText: 'To location',
                              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
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
                          _searchLocation2Controller.text = suggestion;
                        },
                      ),
                      TextFormField(
                        controller: _searchDateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: InputDecoration(
                          labelText: 'Select Date',
                          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                          icon: Icon(Icons.date_range, size: 50, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          // Show loading indicator
                          EasyLoading.show(status: 'Searching...');
                          await Future.delayed(Duration(seconds: 3));
                          EasyLoading.dismiss();

                          // Perform search and navigate to the SearchPage
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchResult(
                                searchLocation1: _searchLocation1Controller.text,
                                searchLocation2: _searchLocation2Controller.text,
                                searchDate: _searchDateController.text,
                              ),
                            ),
                          );

                          // Hide loading indicator after the search is complete
                          EasyLoading.dismiss();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Center(
                            child: Text(
                              'Search Bus',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
                            ),
                          ),
                        ),
                      ),
                      CarouselSlider.builder(
                        itemCount: images.length,
                        options: CarouselOptions(

                          height: 250,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return Container(
                            child: Center(
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,

                              ),
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.map((url) {
                          int index = images.indexOf(url);
                          return Container(
                            width: 20.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
      _searchDateController.text = selectedDate.toLocal().toString();
    }
  }

}


