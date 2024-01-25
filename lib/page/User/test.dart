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


//import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  String fullName = "caesium"; // Initial name, you can fetch the user's name from your data source
  String email = "eka.caesium721@gmail.com"; // Initial email, you can fetch the user's email from your data source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
        ),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://static.wikia.nocookie.net/naruto/images/f/fd/Madara.png/revision/latest?cb=20160115141947",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildEditableField("Full Name", fullName, Icons.person, (value) {
                // Update the user's name
                setState(() {
                  fullName = value;
                });
              }),
             // buildNonEditableField("E-mail", email, Icons.email),
              buildTextField("Password", "********", true),
              buildTextField("Location", "Dhaka,Bangladesh", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back when the cancel button is pressed
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement logic to update the user's information in your data source (e.g., Firebase Firestore)
                      // For demonstration purposes, we print the updated name to the console.
                      print("Updated Name: $fullName");

                      // After updating the user's information, navigate back to the settings page.
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildEditableField(String labelText, String value, IconData icon, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: labelText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: value,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
