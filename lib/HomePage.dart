
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/search.dart';
import 'searchpage.dart';

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



          ],
        ),
      ),



    );

  }

}
class home extends StatefulWidget{




  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  late DateTime _dateTime = DateTime.now();
  void getDatePicker(){

    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025)
    ).then((value){
      setState((){
        _dateTime=value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 200, 171, 228),
                    Color.fromARGB(255, 143, 118, 198),
                    Color.fromARGB(255, 92, 52, 156),
                    Color.fromARGB(255, 91, 19, 172),
                  ],

                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      IconButton(onPressed: (){Navigator.pop(context);
                      },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                          padding:EdgeInsets.only(right: 20),
                          child:Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          )
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top:20,left:30 ),
                      child: Text(
                        'WELCOME TO YOUR APPLICATION',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  ),
                  const Padding(padding: EdgeInsets.only(top:20,left:30 ),
                      child: Text(
                        'where do you want to go',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210,left: 20,right: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(5,5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'From',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,

                        ),

                         //TextButton(onPressed: (){
                         //  Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()));
                        // }, child: Text("select your location")
                        // ),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>searchpage()));
                        }, child: Text('Select your location')),

                        Text(
                          'To',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>searchpage()));
                        }, child: Text('Select your location')),
                      ],
                    ),
                    const Icon(Icons.swap_vert_rounded,color: Colors.deepPurple,size: 60,),
                  ],
                ),
              ),


            ),



            Padding(

              padding: const EdgeInsets.only(top: 450,left: 20,right: 20),
              child: Container(

                height: 100,
                width: 500,

                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(

                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(12),

                ),

                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),


                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed:(){
                          getDatePicker();
                        },
                            icon: Icon(Icons.calendar_month,color: Colors.deepPurple,)),
                        Text(_dateTime.day.toString()+'/'+_dateTime.month.toString()+'/'+_dateTime.year.toString(),style: TextStyle(fontSize: 18),)
                      ],
                    ),


                  ),
                ),
              )

            ),
            Padding(
              padding: const EdgeInsets.only(top: 570,left: 20,right: 20),
              child: Container(

                width: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(5,5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),

                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Text("Search",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));
                    },
                      child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    )

                  ],

                ),

              ),
            ),



          ],
        ),
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
class timeanddate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Support page"),
      ),
    );
  }
}



