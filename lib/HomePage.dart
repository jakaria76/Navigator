
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/profile%20page.dart';
import 'package:navigator/search.dart';
import 'package:navigator/setting%20page.dart';
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
          title: Center(child: Text('Navigator',style: TextStyle(color: Colors.white,fontSize: 30),)),
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
              padding: const EdgeInsets.only(top: 170,left: 20,right: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
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
              padding: const EdgeInsets.only(top: 380,left: 20,right: 20),
              child: GestureDetector(


                  child: Container(
                    width: 200,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Select your date',style: TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.normal),),
                    ),
                  )

              ),
            ),



            Padding(

              padding: const EdgeInsets.only(top: 430,left: 20,right: 20),
              child: Container(

                height: 80,
                width: 400,

                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(

                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),

                ),


                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
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
              padding: const EdgeInsets.only(top: 520,left: 20,right: 20),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                  },

                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Search',style: TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.normal),),
                    ),
                  )

              ),
            ),



          ],
        ),
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
        title: Text("Offers",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/cashback.jpeg",),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 90,
                            width: 60,
                            color: Colors.redAccent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 90,
                            width: 310,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text('Offer Name',style: TextStyle(fontSize: 16),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("20/12/2021"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            height: 50,
                                            child: Text("Get Up to 40% Cash Back On 1st Payments",style: TextStyle(fontSize: 18),)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1,), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
              child: Container(
                height: 305,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,left: 8.0,right: 8.0),
              child: Container(
                height: 305,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),

              ),
            ),
          ],
        ),
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/callsupport.png'), fit: BoxFit.cover),
        ),
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



