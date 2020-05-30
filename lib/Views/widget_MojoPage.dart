import 'package:flutter/material.dart';



class MojoPage extends StatefulWidget{

  

  _MojoPageState createState()=> new _MojoPageState();
}
class _MojoPageState extends State<MojoPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Mojo Page'),
     ),
     body: new Center(
       child: new Text('Mojo Page'),
     ),
    );
  }
  
}