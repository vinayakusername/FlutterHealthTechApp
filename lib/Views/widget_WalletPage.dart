import 'package:flutter/material.dart';



class WalletPage extends StatefulWidget{

  

  _WalletPageState createState()=> new _WalletPageState();
}
class _WalletPageState extends State<WalletPage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Wallet Page'),
     ),
     body: new Center(
       child: new Text('Wallet Page'),
     ),
    );
  }
  
}