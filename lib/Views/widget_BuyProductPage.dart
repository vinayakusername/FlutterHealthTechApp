import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_AppBar.dart';

class BuyProductPage extends StatefulWidget {
  @override
  _BuyProductPageState createState() => _BuyProductPageState();
}

class _BuyProductPageState extends State<BuyProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: header(context,strTitle: "Buy Products"),
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