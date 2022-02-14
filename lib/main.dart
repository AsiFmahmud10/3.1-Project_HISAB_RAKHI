import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'signin.dart';

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
        '/': (context) => home(),
        '/signup': (context) => signup(),
        '/signin': (context) => signin(),
      },
    );
  }
}
