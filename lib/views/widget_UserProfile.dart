import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget
{

  @override
  _ProfilePageState createState()=>new _ProfilePageState();
 }

 class _ProfilePageState extends State<ProfilePage>
 {
   
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('User Profile Page'),
     ),
     body: Container
             (
                alignment: Alignment.center,
                child: Text("MY Profile Page",style: TextStyle(color: Colors.black,fontSize: 20.0),),
             ) ,
    );
  }
  
}