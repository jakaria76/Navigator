import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Notifications',
      home: Notification(),
    );
  }
}

class Notification extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
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
      _showNotification(message.data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");
      // Handle the incoming message when the app is opened from terminated state
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
  }

  void _showNotification(Map<String, dynamic> message) {
    // Customize this method to show a notification in your app
    // You can use packages like flutter_local_notifications for a more advanced implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New Notification'),
        content: Text(message['title']),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Notifications'),
      ),
      body: Center(
        child: Text('Welcome to Firebase Notifications!'),
      ),
    );
  }
}
