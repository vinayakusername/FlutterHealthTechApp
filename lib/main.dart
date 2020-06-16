
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_tech_app1/helper/authenticate.dart';
import 'package:health_tech_app1/helper/constants.dart';
import 'package:health_tech_app1/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Constants.getUerLoggedInSharedPreference().then((value) {
      setState(() {
        isUserLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isUserLoggedIn ? Home() : Authenticate(),
    );
  }
}
