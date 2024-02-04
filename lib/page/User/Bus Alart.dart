import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: noti(),
    );
  }
}

class noti extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Notification Demo')),
      ),
      body: Container(
        color: Colors.blueGrey[700],
        child: Center(
          child: ElevatedButton(
            onPressed: _showNotification,
            child: Text('Show Notification'),
          ),
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    // Ensure you have initialized the FlutterLocalNotificationsPlugin object
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    // Initialize settings for Android notification channel
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );

    // Define overall notification details
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Notification',
      'Hello, you clicked the button!',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
