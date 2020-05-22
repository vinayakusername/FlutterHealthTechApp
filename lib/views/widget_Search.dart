import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget
{

  @override
  _SearchPageState createState()=>new _SearchPageState();
 }

 class _SearchPageState extends State<SearchPage>
 {
   
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Search Page'),
     ),
     body: Container
             (
                alignment: Alignment.center,
                child: Text("MY Search Page",style: TextStyle(color: Colors.black,fontSize: 20.0),),
             ) ,
    );
  }
  
}