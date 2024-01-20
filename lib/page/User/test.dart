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
