import 'package:flutter/material.dart';



class BuyPage extends StatefulWidget{

  

  _BuyPageState createState()=> new _BuyPageState();
}
class _BuyPageState extends State<BuyPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Buy Page'),
     ),
     body: new Center(
       child: new Text('Buy Page'),
     ),
    );
  }
  
}