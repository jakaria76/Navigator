import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseMessaging();
  }

  void _initializeFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      // Handle the incoming message when the app is in the foreground
      _handleNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");
      // Handle the incoming message when the app is opened from terminated state
      _handleNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: false,
    );
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    // Handle the incoming message when the app is in the background
    _handleNotification(message);
  }

  void _handleNotification(RemoteMessage message) {
    // Customize this method to handle the notification in your Notifications page
    // For example, you can update your UI or navigate to a specific part of the app
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Your Notifications Page Content'),
      ),
    );
  }
}
