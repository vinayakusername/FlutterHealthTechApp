import 'package:flutter/material.dart';

class MojoPage extends StatefulWidget
{

 @override
 _MojoPageState createState()=> _MojoPageState();
}

class _MojoPageState extends State<MojoPage>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Mojo Page'),
     ),
     body: Container
             (
                alignment: Alignment.center,
                child: Text("MY Mojo Page",style: TextStyle(color: Colors.black,fontSize: 20.0),),
             ) ,
    );
  }
  
}