import 'package:flutter/material.dart';
import 'package:hisab_khata/signin.dart';
import 'package:hisab_khata/_signup.dart';
import 'package:hisab_khata/home.dart';

import '_home.dart';



void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/signup': (context) => SignUp(),
        '/signin': (context) => signin(),
      },
    );
  }
}
