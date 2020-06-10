import 'package:flutter/material.dart';

class BuyProductPage extends StatefulWidget {
  @override
  _BuyProductPageState createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Center(
        child: Text(
          "Buy Products",
          style: TextStyle(color:Colors.pink),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}