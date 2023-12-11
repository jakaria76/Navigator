
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage(),);
  }

}
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navigator'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home),text: "home",),
              Tab(icon: Icon(Icons.bus_alert),text: "bus alert",),
              Tab(icon: Icon(Icons.message),text: "message ",),
              Tab(icon: Icon(Icons.discount),text: "Offers",),
              Tab(icon: Icon(Icons.settings),text: "setting",),

            ],
          ),


        ),

        body: TabBarView(
          children: [
            home(),
            bus_alert(),
            message(),
            offer(),
            setting(),
            Offer(),
            setting(),


          ],
        ),
      ),



    );

  }

}
class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),

    );
  }

}
class setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("setting page"),
      ),
    );
  }

}
class email extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("email page"),
      ),
    );
  }

}
class notification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification page"),
      ),
    );
  }

}
class manage_account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("manage_accout page"),
      ),
    );
  }

}
class Offer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers page"),
      ),
    );
  }

}
class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search page"),
      ),
    );
  }

}
class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile page"),
      ),
    );
  }

}
class bus_alert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bus_alert page"),
      ),
    );
  }
}
class message extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("message"),
      ),
    );
  }
}
class offer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("offer page"),
      ),
    );
  }
}
class callsupport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Support page"),
      ),
    );
  }
}


