import 'package:flutter/material.dart';



class SupportPage extends StatefulWidget{

  

  _SupportPageState createState()=> new _SupportPageState();
}
class _SupportPageState extends State<SupportPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Support Page'),
     ),
     body: new Center(
       child: new Text('Support Page'),
     ),
    );
  }
  
}