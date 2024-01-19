import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:navigator/page/User/Massage.dart';
import 'package:navigator/page/User/profile%20page.dart';
import 'package:navigator/page/User/Search Result.dart';
import 'package:navigator/page/User/setting%20page.dart';
import '../bus and user select page.dart';
import 'Bus Alart.dart';
import 'Map page.dart';
import 'Offer page.dart';
import 'call support.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Navigator',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.bus_alert), text: "Bus alert"),
              Tab(icon: Icon(Icons.message), text: "Message "),
              Tab(icon: Icon(Icons.discount), text: "Offers"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
              Tab(icon: Icon(Icons.location_on), text: "Map"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
            if (index == 1) {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
            }
            if (index == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
                    style: TextStyle(color: Colors.deepOrange, fontSize: 47),
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
                title: Text("Bus Alart"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => busalart()));
                },
              ),
              ListTile(
                leading: Icon(Icons.discount),
                title: Text("Offers"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => offer()));
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
            busalart(),
            messages_screen(),
            offer(),
            SettingsPage(),
            map(),
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          // Replace the image URL with your actual background image
          Image.network(
            'https://example.com/your-background-image.jpg',
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 60,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    'WELCOME TO YOUR APPLICATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    'where do you want to go',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210, left: 0, right: 0),
            child: Card(
              color: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _searchLocation1Controller,
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_on, size: 50),
                          labelText: 'From location',
                          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
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
                      _searchLocation1Controller.text = suggestion;
                    },
                  ),
                  TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _searchLocation2Controller,
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_city, size: 50),
                          labelText: 'To location',
                          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
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
                      labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      icon: Icon(Icons.date_range, size: 50),
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      // Perform search and navigate to the SearchPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResult(
                            searchLocation1: _searchLocation1Controller.text,
                            searchLocation2: _searchLocation2Controller.text,
                            searchDate: _searchDateController.text,
                          ),
                        ),
                      );
                    },
                    child: Center(
                      heightFactor: 2,
                      child: Text(
                        'Search Bus',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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






class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          // ... (rest of the code)
        ),
        bottomNavigationBar: BottomNavigationBar(
          // ... (rest of the code)
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                // ... (rest of the code)
              ),
              _HomeContentState().buildListTile(Icons.home, "Home", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              }),
              _HomeContentState().buildListTile(Icons.call, "Call Support", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => callsupport()));
              }),
              _HomeContentState().buildListTile(Icons.settings, "Settings", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
              _HomeContentState().buildListTile(Icons.notifications, "Bus Alert", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => busalart()));
              }),
              _HomeContentState().buildListTile(Icons.discount, "Offers", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => offer()));
              }),
              _HomeContentState().buildListTile(Icons.logout, "Log Out", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => bus_user()));
              }),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeContent(),
            busalart(),
            messages_screen(),
            offer(),
            SettingsPage(),
            map(),
          ],
        ),
      ),
    );
  }
}

class _HomeContentState extends State<HomeContent> {
  // ... (rest of the code)

  Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

// ... (rest of the code)
}
