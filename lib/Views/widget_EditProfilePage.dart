import 'package:flutter/material.dart';



class EditProfilePage extends StatefulWidget{

  

  _EditProfilePageState createState()=> new _EditProfilePageState();
}
class _EditProfilePageState extends State<EditProfilePage>{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Edit Profile Page'),
     ),
     body: new Center(
       child: new Text('Edit Profile Page'),
     ),
    );
  }
  
}