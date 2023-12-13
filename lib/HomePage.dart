
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
                        'hi md jakaria',
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
                      children: const [
                        Text(
                          'From',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location1',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'To',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location2',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        )
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
                      children: const [
                        Text(
                          'From',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location1',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'To',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location2',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        )
                      ],
                    ),
                    const Icon(Icons.swap_vert_rounded,color: Colors.deepPurple,size: 60,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 690,left: 20,right: 20),
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
                      children: const [
                        Text(
                          'From',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location1',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'To',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location2',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        )
                      ],
                    ),
                    const Icon(Icons.swap_vert_rounded,color: Colors.deepPurple,size: 60,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 930,left: 20,right: 20),
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
                      children: const [
                        Text(
                          'From',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location1',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'To',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        ),
                        Text(
                          'Location2',
                          style:TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ) ,
                        )
                      ],
                    ),
                    const Icon(Icons.swap_vert_rounded,color: Colors.deepPurple,size: 60,),
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



