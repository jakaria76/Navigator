import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:navigator/page/User/HomePage.dart';
import '../bus and user select page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
  String name = "jakaria";
  String email = "jakaria";
  String phoneNumber = "123-456-7890";
  String gender = "Male"; // Default gender

  // Function to update the profile with the new information
  void updateProfile(String newName, String newEmail, String newPhoneNumber, String newGender) {
    setState(() {
      name = newName;
      email = newEmail;
      phoneNumber = newPhoneNumber;
      gender = newGender;
    });

    // Update the user information in Firebase Firestore
    updateUserInformation(uid, newName, newEmail, newPhoneNumber, newGender);
  }

  // Function to open the image picker for changing the profile picture
  void changeProfilePicture() {
    // Implement your logic for changing the profile picture here
    // You may use plugins like image_picker for this purpose
  }

  // Function to update user information in Firebase Firestore
  Future<void> updateUserInformation(String uid, String newName, String newEmail, String newPhoneNumber, String newGender) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': newName,
        'email': newEmail,
        'phoneNumber': newPhoneNumber,
        'gender': newGender,
      });
    } catch (e) {
      print("Error updating user information: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                accountName: Text(
                  'Navigator',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 47),
                ),
                accountEmail: Text("navigatorofficial@gmail.com"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("LogOut"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => bus_user()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Call the function to change the profile picture
                changeProfilePicture();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/jakaria.jpg"), // Provide a default image
              ),
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.black,
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.black,
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  email,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.black,
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  phoneNumber,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              shadowColor: Colors.black,
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  "Gender",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  gender,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Implement your logic to navigate to the update profile page
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfilePage(
                      currentName: name,
                      currentEmail: email,
                      currentPhoneNumber: phoneNumber,
                      currentGender: gender,
                      onUpdate: updateProfile,
                    ),
                  ),
                );

                // Check if the route has been popped and update the values
                if (result == true) {
                  setState(() {
                    // Update the values here if needed
                  });
                }
              },
              child: Text("Update Profile"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateProfilePage extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentPhoneNumber;
  final String currentGender;
  final Function(String, String, String, String) onUpdate;

  UpdateProfilePage({
    required this.currentName,
    required this.currentEmail,
    required this.currentPhoneNumber,
    required this.currentGender,
    required this.onUpdate,
  });

  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  String genderValue = "Male";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentName);
    emailController = TextEditingController(text: widget.currentEmail);
    phoneNumberController = TextEditingController(text: widget.currentPhoneNumber);
    genderValue = widget.currentGender;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            DropdownButton<String>(
              value: genderValue,
              onChanged: (String? newValue) {
                setState(() {
                  genderValue = newValue!;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call the onUpdate function to update the profile
                widget.onUpdate(
                  nameController.text,
                  emailController.text,
                  phoneNumberController.text,
                  genderValue,
                );

                // Return a result to indicate that the changes are saved
                Navigator.pop(context, true);
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
