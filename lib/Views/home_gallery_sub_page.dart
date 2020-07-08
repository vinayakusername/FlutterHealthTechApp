import 'package:flutter/material.dart';
//import 'package:health_tech_app1/Views/home_tutorial_sub_page.dart';

class HomeGallerySubPage extends StatefulWidget {
  @override
  _HomeGallerySubPageState createState() => _HomeGallerySubPageState();
}

class _HomeGallerySubPageState extends State<HomeGallerySubPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView
    (
       slivers: <Widget>
       [
         //HomeSliverAppBar('Gallery'),
         _buildSliverContent()
       ],
    );
  }

  SliverFillRemaining _buildSliverContent()
  {
    return SliverFillRemaining
    (
      child: Center
      (
        child: Text
        (
          'Gallery',
           style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}