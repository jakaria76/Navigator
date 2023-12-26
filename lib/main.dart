
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator/splash_page.dart';

import 'MyLogin.dart';
import 'firebase_options.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAYrfyxqFWyKtNBRZ4AxBZXChpFBD5YZ0c", appId: "1:22471713389:web:e578c8c3ed50b5d3911564", messagingSenderId: "22471713389", projectId: "jakaria-61fa1"));
  }
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:splash_page(
        child:LogIn(),
      ),
    );
  }
}



