import 'package:flutter/material.dart';
import 'package:health_tech_app1/Mapping.dart';
import 'package:health_tech_app1/utility/DBWebService_FirebaseAuthentication.dart';
import 'package:health_tech_app1/views/widget_BuyPage.dart';
import 'package:health_tech_app1/views/widget_GalleryEventPage.dart';
import 'package:health_tech_app1/views/widget_MojoPage.dart';
import 'package:health_tech_app1/views/widget_Quiz.dart';
import 'package:health_tech_app1/views/widget_Search.dart';
import 'package:health_tech_app1/views/widget_SupportPage.dart';
import 'package:health_tech_app1/views/widget_UserProfile.dart';
import 'package:health_tech_app1/views/widget_WalletPage.dart';
import 'package:health_tech_app1/views/widget_homePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.pink
      ),
      //home: LoginRegisterPage(),

      home: MappingPage(auth: Auth(),),
      
      routes: <String,WidgetBuilder>{
        // When navigating to the "/a" route, build the Settings Page widget.
        '/a':(BuildContext context) => new SupportPage(),
         // When navigating to the "/b" route, build the Notification widget. 
        '/b':(BuildContext context) => new GalleryEventsPage(),
         // When navigating to the "/c" route, build the Payment Page widget.
        '/c':(BuildContext context) => new WalletPage(),
        '/d':(BuildContext context) => new SearchPage(),
        '/e':(BuildContext context) => new QuizPage(),
        '/f':(BuildContext context) => new ProfilePage(),
        '/g':(BuildContext context) => new MojoPage(),
        '/h':(BuildContext context) => new MyHomePage(),
        '/i':(BuildContext context) => new BuyPage(),
      },
    );
  }
}


