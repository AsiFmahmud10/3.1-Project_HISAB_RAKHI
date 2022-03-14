import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hisab_khata/signin.dart';
import 'package:hisab_khata/_signup.dart';
import 'package:hisab_khata/menu.dart';
import 'package:hisab_khata/home.dart';
import 'package:hisab_khata/signup.dart';
import 'package:hisab_khata/customer_detail.dart';

import '_home.dart';
import 'package:hisab_khata/customer_search.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(ReportAdapter());


  await Hive.openBox('userData');
  await Hive.openBox('customerData');
  await Hive.openBox('reportData');

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: home(),
      initialRoute: '/',
      routes: {
        '/': (context) => search(),
        '/addReport': (context) => CustomerDetail(),
        '/menu': (context) => menu(),
        '/signup': (context) => SignUp(),
        '/signin': (context) => signin(),
        //'/search': (context) => search(),
        '/home': (context) => Home(),
        '/add': (context) => AddCustomer(),
      },
    );
  }
}
