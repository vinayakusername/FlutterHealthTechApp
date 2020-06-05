import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_AppBarPage.dart';



class BuyPage extends StatefulWidget{

  

  _BuyPageState createState()=> new _BuyPageState();
}
class _BuyPageState extends State<BuyPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
    
     appBar: header(context,strTitle:"Buy Products"),
     body: new Center(
       child: new Text('Buy Page'),
     ),
    );
  }
  
}