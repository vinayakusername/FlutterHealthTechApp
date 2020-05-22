import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget
{

  @override
  _BuyPageState createState()=>new _BuyPageState();
 }

 class _BuyPageState extends State<BuyPage>
 {
   
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
    //  appBar: new AppBar(
    //    title: new Text('Buy Page'),
    //  ),
     body: Container
             (
                alignment: Alignment.center,
                child: Text("MY Buy Page",style: TextStyle(color: Colors.black,fontSize: 20.0),),
             ) ,
    );
  }
  
}