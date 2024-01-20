

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

    totalPrice = selectedSeats.length * 100;
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

                Tab(text: ("Select your seat"),),
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
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: $totalPrice for ${selectedSeats.length} seat(s)',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic for 'Next' button
                    // Access selectedSeats and calculate the total price here
                    int totalPrice = selectedSeats.length * 729; // Update the logic as needed
                    // Display total price in a dialog or navigate to the next screen
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Total Price'),
                          content: Text('Total: $totalPrice for ${selectedSeats.length} seat(s)'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>passenger_details()));
                              },
                              child: Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                  child: Text('Next', style: TextStyle(color: Colors.blueGrey[800])),
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
                    SeatWidget(name: 'A1', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'A2', color: Colors.grey),
                    SeatWidget(name: 'A3', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'B1', color: Colors.grey),
                    SeatWidget(name: 'B2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'B3', color: Colors.grey),
                    SeatWidget(name: 'B4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'C1', color: Colors.grey),
                    SeatWidget(name: 'C2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'C3', color: Colors.grey),
                    SeatWidget(name: 'C4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'D1', color: Colors.grey),
                    SeatWidget(name: 'D2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'D3', color: Colors.grey),
                    SeatWidget(name: 'D4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'E1', color: Colors.grey),
                    SeatWidget(name: 'E2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'E3', color: Colors.grey),
                    SeatWidget(name: 'E4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'F1', color: Colors.grey),
                    SeatWidget(name: 'F2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'F3', color: Colors.grey),
                    SeatWidget(name: 'F4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'G1', color: Colors.grey),
                    SeatWidget(name: 'G2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'G3', color: Colors.grey),
                    SeatWidget(name: 'G4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'H1', color: Colors.grey),
                    SeatWidget(name: 'H2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'H3', color: Colors.grey),
                    SeatWidget(name: 'H4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'I1', color: Colors.grey),
                    SeatWidget(name: 'I2', color: Colors.grey),
                    Spacer(),
                    SeatWidget(name: 'I3', color: Colors.grey),
                    SeatWidget(name: 'I4', color: Colors.grey),
                  ],
                ),
                Row(
                  children: [
                    SeatWidget(name: 'J1', color: Colors.grey),
                    SeatWidget(name: 'J2', color: Colors.grey),
                    SeatWidget(name: 'J3', color: Colors.grey),
                    SeatWidget(name: 'J4', color: Colors.grey),
                    SeatWidget(name: 'J5', color: Colors.grey),
                  ],
                ),
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
}

class SeatWidget extends StatefulWidget {
  final String name;
  final Color color;

  const SeatWidget({Key? key, required this.name, required this.color})
      : super(key: key);

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
