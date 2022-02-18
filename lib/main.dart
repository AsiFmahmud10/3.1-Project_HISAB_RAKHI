import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hisab_khata/signin.dart';
import 'package:hisab_khata/_signup.dart';
import 'package:hisab_khata/home.dart';
import '_home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';


void main() async{

  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
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
