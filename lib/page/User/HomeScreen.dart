import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ChatRoom (1).dart';

class HomeScreen5 extends StatefulWidget {
  @override
  _HomeScreen5State createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("username", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs.isNotEmpty ? value.docs[0].data() : null;
        isLoading = false;
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(


    child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      automaticallyImplyLeading: false,
    backgroundColor: Colors.blueGrey[700],
    elevation: 0,
    ),
      body: Container(
        color: Colors.blueGrey[700],
        child: isLoading
            ? Center(
          child: Container(
            height: size.height / 20,
            width: size.height / 20,
            child: CircularProgressIndicator(),
          ),
        )
            : Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 14,
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                height: size.height / 14,
                width: size.width / 1.15,
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            ElevatedButton(
              onPressed: onSearch,
              child: Text("Search"),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            if (userMap != null)
              ListTile(
                onTap: () {
                  String roomId = chatRoomId(
                      _auth.currentUser!.displayName!,
                      userMap!['username'] ?? "");

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ChatRoom(
                        chatRoomId: roomId,
                        userMap: userMap!,
                      ),
                    ),
                  );
                },
                leading: Icon(Icons.chat, color: Colors.blue),
                title: Text(
                  userMap!['username'] ?? "",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(userMap!['email'] ?? "",style: TextStyle(
                  color: Colors.blue,fontSize: 20
                ),),

              )
            else
              Container(),
          ],
        ),
      ),
    ),
    );
  }
}
