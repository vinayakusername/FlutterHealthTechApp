import 'package:flutter/material.dart';

class MojoPage extends StatefulWidget {
  @override
  _MojoPageState createState() => _MojoPageState();
}

class _MojoPageState extends State<MojoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar
      (
        title: Text('Mojo Page'),
      ),
      body: Center(child:Text('Mojo')),
    );
  }
}