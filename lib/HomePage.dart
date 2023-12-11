
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
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),label:"search"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:"profile"),

          ],
          onTap: (int index){
            if(index==0)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
            }
            if(index==1)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
            }
            if(index==2)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
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
                        color: Colors.green),
                    accountName: Text('Navigator',style: TextStyle(color: Colors.deepOrange,fontSize: 47,),),
                    accountEmail: Text("navigatorofficial@gmail.com"),

                    onDetailsPressed: (){

                    },
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
                  },

                ),
                ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Call Support"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>callsupport()));
                  },

                ),

                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Setting"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()));
                  },

                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("Email"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>email()));
                  },

                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notification"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>notification()));
                  },

                ),
                ListTile(
                  leading: Icon(Icons.manage_accounts),
                  title: Text("Manage_Account"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>manage_account()));
                  },

                ),
                ListTile(
                  leading: Icon(Icons.discount),
                  title: Text("Offers"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));
                  },

                ),

              ],
            )
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
g


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


