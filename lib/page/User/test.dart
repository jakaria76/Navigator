class HomePage extends StatelessWidget {
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
