import 'package:flutter/material.dart';

class MojoPage extends StatefulWidget {
  @override
  _MojoPageState createState() => _MojoPageState();
}

class _MojoPageState extends State<MojoPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold
    (
      body: Center(
        child: Text(
          "Mojo Page",
          style: TextStyle(color:Colors.pink,fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}