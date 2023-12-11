import 'dart:js';

import 'package:flutter/material.dart';

import 'MyLogin.dart';
import 'MyRegister.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),

    },
  ));
}

