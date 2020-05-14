import 'package:flutter/material.dart';



class GalleryEventsPage extends StatefulWidget
{

  _GalleryEventsPageState createState()=> new _GalleryEventsPageState();
}

class _GalleryEventsPageState extends State<GalleryEventsPage>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('GalleryEventsPage'),
     ),
     body: new Center(
       child: new Text('GalleryEventsPage'),
     ),
    );
  }
  
}