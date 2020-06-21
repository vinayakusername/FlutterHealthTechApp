import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/home.dart';
import 'package:health_tech_app1/helper/functions.dart';
import 'package:health_tech_app1/views/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

bool _isLoggedIn = false;

@override
   void initState()
    {
      checkUserLoggedInStatus();
      super.initState(); 
    }

checkUserLoggedInStatus() async
{
  _isLoggedIn = await HelperFunctions.getUserLoggedInDetails();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.pink
      ),

      home: (_isLoggedIn ?? false ) ? Home():SignIn() ,
    );
      
     
  }
}


