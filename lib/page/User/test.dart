/*class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Stack(
        children: [
          // Background Image
          Image.network(
            'https://image.lexica.art/full_webp/your-background-image-url.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
              // Drawer content
              // ...
            ),
            body: TabBarView(
              children: [
                HomeContent(),
                busalart(),
                messages_screen(),
                OfferPage(),
                SettingsPage(),
                map(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class SeatWidget extends StatelessWidget {
  final String name;
  final Color color;

  SeatWidget({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15), // Make the seat a little round
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



class SeatWidget extends StatefulWidget {
  final String name;

  SeatWidget({required this.name});

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5 - 4;
    return GestureDetector(
      onTap: () {
        // Toggle seat selection on tap
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2.0),
        width: width,
        height: width / 1.5,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}



///////////////////////////////////


class SeatWidget extends StatefulWidget {
  final String name;

  SeatWidget({required this.name});

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5 - 4;

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2.0),
        width: width,
        height: width / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          color: isSelected ? Colors.black : Colors.orange,
          image: DecorationImage(
            // Replace 'YOUR_IMAGE_URL' with the actual URL of your background image
            image: NetworkImage('YOUR_IMAGE_URL'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/page/User/passenger%20details.dart';

class seatbooking extends StatefulWidget {
  @override
  State<seatbooking> createState() => _seatbookingState();
}

class _seatbookingState extends State<seatbooking> {
  late List<String> selectedSeats;
  late int totalPrice;

  @override
  void initState() {
    super.initState();
    selectedSeats = [];
    totalPrice = 0;
  }

  void updateTotalPrice() {
    setState(() {
      totalPrice = selectedSeats.length * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Welcome to Your Bus'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent[400],
          elevation: 0.0,
          bottom: PreferredSize(
            child: TabBar(
              indicatorColor: Colors.deepPurple,
              tabs: [
                Tab(
                  text: ("Select your seat"),
                ),
              ],
            ),
            preferredSize: Size(0.0, 40.0),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: $totalPrice for ${selectedSeats.length} seat(s): ${selectedSeats.join(", ")}',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic for 'Next' button
                    // Access selectedSeats and calculate the total price here
                    // Total price is already updated in updateTotalPrice
                    // Display total price in a dialog or navigate to the next screen
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Total Price'),
                          content: Text(
                              'Total: $totalPrice for ${selectedSeats.length} seat(s): ${selectedSeats.join(", ")}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            passenger_details()));
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Next',
                      style: TextStyle(color: Colors.blueGrey[800])),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 12.0),
                      child: Center(child: Text('GATE')),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(right: 12.0),
                      child: Center(child: Text('DRIVER')),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'A1', color: Colors.grey, onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'A2', color: Colors.grey, onSelect: seatSelected),
                    SeatWidget(name: 'A3', color: Colors.grey, onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'B1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'B2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'B3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'B4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'C1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'C2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'C3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'C4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'D1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'D2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'D3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'D4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'E1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'E2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'E3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'E4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'F1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'F2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'F3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'F4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'G1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'G2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'G3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'G4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'H1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'H2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'H3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'H4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'I1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'I2', color: Colors.grey,onSelect: seatSelected),
                    Spacer(),
                    SeatWidget(name: 'I3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'I4', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'J1', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'J2', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'J3', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'J4', color: Colors.grey,onSelect: seatSelected),
                    SeatWidget(name: 'J5', color: Colors.grey,onSelect: seatSelected),
                  ],
                ),

                // ... (similar rows for other seats)
              ],
            ),
            Container(
              child: Center(child: Text('Available')),
            ),
          ],
        ),
      ),
    );
  }

  void seatSelected(String seatName) {
    setState(() {
      if (selectedSeats.contains(seatName)) {
        selectedSeats.remove(seatName);
      } else {
        selectedSeats.add(seatName);
      }
      updateTotalPrice();
    });
  }
}

class SeatWidget extends StatefulWidget {
  final String name;
  final Color color;
  final Function(String) onSelect;

  const SeatWidget({
    Key? key,
    required this.name,
    required this.color,
    required this.onSelect,
  }) : super(key: key);

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5 - 4;
    return GestureDetector(
      onTap: () {
        // Toggle seat selection on tap
        setState(() {
          isSelected = !isSelected;
          widget.onSelect(widget.name);
        });
      },
      child: Container(
        margin: EdgeInsets.all(2.0),
        width: width,
        height: width / 1.5,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.blueGrey[500],
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.black,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.greenAccent : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Bus Management/loginPage2.dart';
import 'User/MyLogin.dart';

class BusUser extends StatefulWidget {
  const BusUser({Key? key}) : super(key: key);

  @override
  State<BusUser> createState() => _BusUserState();
}

class _BusUserState extends State<BusUser> {
  @override
  Widget build(BuildContext context) {
    final action = CupertinoActionSheet(
      message: Text("Select The Item", style: TextStyle(fontSize: 20)),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn()),
            );
          },
          child: Text("User", style: TextStyle(fontSize: 30)),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn2()),
            );
          },
          child: Text("Bus Management", style: TextStyle(fontSize: 30)),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel", style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/your_placeholder_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select your item',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => action,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Click",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
///////////////////////////////////////////////
final action = CupertinoActionSheet(
  title: Text(
    "Select Your Role",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  actions: [
    CupertinoActionSheetAction(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      },
      child: Text("User", style: TextStyle(fontSize: 18)),
    ),
    CupertinoActionSheetAction(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogIn2()),
        );
      },
      child: Text("Bus Management", style: TextStyle(fontSize: 18)),
    ),
  ],
  cancelButton: CupertinoActionSheetAction(
    child: Text("Cancel", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
);
////////////////////
final action = CupertinoActionSheet(
  title: Text(
    "Select Your Role",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  actions: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn()),
            );
          },
          child: Text("User", style: TextStyle(fontSize: 18)),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn2()),
            );
          },
          child: Text("Bus Management", style: TextStyle(fontSize: 18)),
        ),
      ],
    ),
  ],
  cancelButton: CupertinoActionSheetAction(
    child: Text("Cancel", style: TextStyle(color: Colors.red)),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
);
/////////////////////////////////////////
class _bus_userState extends State<bus_user> {
  @override
  Widget build(BuildContext context) {
    final action = CupertinoActionSheet(
      title: Text(
        "Select Your Role",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn()),
            );
          },
          child: Text("User", style: TextStyle(fontSize: 18)),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn2()),
            );
          },
          child: Text("Bus Management", style: TextStyle(fontSize: 18)),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel", style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(context: context, builder: (context) => action);
              },
              child: Text(
                "Click",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//////////////////////////////////
class _bus_userState extends State<bus_user> {
  @override
  Widget build(BuildContext context) {
    final action = CupertinoActionSheet(
      title: Text(
        "Select Your Role",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn()),
            );
          },
          child: Text("User", style: TextStyle(fontSize: 18)),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogIn2()),
            );
          },
          child: Text("Bus Management", style: TextStyle(fontSize: 18)),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel", style: TextStyle(color: Colors.red)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select your item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(context: context, builder: (context) => action);
              },
              child: Text(
                "Click",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////
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
      body: StreamBuilder(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => seatbooking()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://example.com/your_background_image_url.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
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
                    ),
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
    );
  }
}
//////////////////=----------------------------------------------
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
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
//////.................................................
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
      body: StreamBuilder(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => seatbooking()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://example.com/your_background_image_url.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
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
                    ),
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
    );
  }
}
//------------------------------
import 'package:flutter/material.dart';

class BusManagementProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Bus Management Author',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bus Management Company',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              ProfileField(label: 'Name', value: 'John Doe'),
              ProfileField(label: 'Vehicle Name', value: 'Bus XYZ'),
              ProfileField(label: 'Vehicle Type', value: 'Semi Sleeper'),
              ProfileField(label: 'Vehicle Model', value: 'Model ABC'),
              ProfileField(label: 'Contact Info', value: '+1 123-456-7890'),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the profile editing page
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$label: ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BusManagementProfilePage(),
  ));
}
//-------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget {
  const Profile2({Key? key}) : super(key: key);

  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  TextEditingController nameController = TextEditingController(text: 'John Doe');
  TextEditingController vehicleNameController =
  TextEditingController(text: 'Bus XYZ');
  TextEditingController vehicleTypeController =
  TextEditingController(text: 'Semi Sleeper');
  TextEditingController vehicleModelController =
  TextEditingController(text: 'Model ABC');
  TextEditingController contactInfoController =
  TextEditingController(text: '+1 123-456-7890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Bus Management Author',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Bus Management Company',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 1),
                EditableProfileField(
                  label: 'Name',
                  controller: nameController,
                ),
                EditableProfileField(
                  label: 'Vehicle Name',
                  controller: vehicleNameController,
                ),
                EditableProfileField(
                  label: 'Vehicle Type',
                  controller: vehicleTypeController,
                ),
                EditableProfileField(
                  label: 'Vehicle Model',
                  controller: vehicleModelController,
                ),
                EditableProfileField(
                  label: 'Contact Info',
                  controller: contactInfoController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Update the user's profile with the edited values
                    // You can print or use the updated values as needed
                    print('Name: ${nameController.text}');
                    print('Vehicle Name: ${vehicleNameController.text}');
                    print('Vehicle Type: ${vehicleTypeController.text}');
                    print('Vehicle Model: ${vehicleModelController.text}');
                    print('Contact Info: ${contactInfoController.text}');
                  },
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditableProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const EditableProfileField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: controller,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
DrawerHeader(
  padding: EdgeInsets.all(0),
  decoration: BoxDecoration(
    color: Colors.blue,  // You can change the color to your preference
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.blue, Colors.green],
    ),
  ),
  child: UserAccountsDrawerHeader(
    decoration: BoxDecoration(color: Colors.transparent),
    accountName: Text(
      'Navigator',
      style: TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      ),
    ),
    accountEmail: Text(
      'navigatorofficial@gmail.com',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    onDetailsPressed: () {},
  ),
);



*/

