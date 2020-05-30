import 'package:flutter/material.dart';
import 'package:health_tech_app1/Mapping.dart';
import 'package:health_tech_app1/Views/widget_GalleryEvent.dart';
import 'package:health_tech_app1/Views/widget_SupportPage.dart';
import 'package:health_tech_app1/Views/widget_WalletPage.dart';
import 'package:health_tech_app1/utility/DBWebService_FireBase_Authentication.dart';


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
        
      },
    );
      
     
  }
}


