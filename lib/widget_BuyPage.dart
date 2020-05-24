import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar
      (
        title: Text('Buy Page'),
      ),
      body: Center(child:Text('Buy Products')),
    );
  }
}