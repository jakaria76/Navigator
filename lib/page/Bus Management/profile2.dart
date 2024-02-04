import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Feed2.dart';
import 'HomePage2.dart';

class profile2 extends StatefulWidget {
  const profile2({super.key});

  @override
  State<profile2> createState() => _profile2State();
}

class _profile2State extends State<profile2> {
  TextEditingController nameController = TextEditingController(text: 'Mr. X');
  TextEditingController vehicleNameController =
  TextEditingController(text: 'volvo');
  TextEditingController vehicleTypeController =
  TextEditingController(text: 'AC');
  TextEditingController vehicleModelController =
  TextEditingController(text: 'RN');
  TextEditingController contactInfoController =
  TextEditingController(text: '01712345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[800],
        items: [

          BottomNavigationBarItem(icon: Icon(Icons.feed,color: Colors.blue,size: 40,),label:"feed"),
          BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.blue,size: 40,),label:"add"),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,size: 40,),label:"profile"),


        ],
        onTap: (int index){

          if(index==0)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Feed2()));
          }
          if(index==1)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2()));
          }
          if(index==2)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>profile2()));
          }
        },
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/AnotherBus2.jpg'),
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
                      color: Colors.black,
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage2()));
                    },
                    child: Text('Save Changes'),
                  ),
                ],
              ),
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