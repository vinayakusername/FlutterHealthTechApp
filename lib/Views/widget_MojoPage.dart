import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_AppBarPage.dart';



class MojoPage extends StatefulWidget{

  

  _MojoPageState createState()=> new _MojoPageState();
}
class _MojoPageState extends State<MojoPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
    
     appBar: header(context,strTitle:"Mojo"),
     body: new Center(
       child: new Text('Mojo Page'),
     ),
    );
  }
  
}