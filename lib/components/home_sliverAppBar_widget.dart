import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {

   final String _title;
   //final TabController _tabController;
   HomeSliverAppBar(this._title);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar
          ( 
            iconTheme: IconThemeData
            (
              color: Colors.black
            ),
            backgroundColor: Colors.pink,
            expandedHeight: 200.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar
            (
              title:Text
              (
                _title,
                style: TextStyle(color:Colors.white),
              ),
              background: Image.network('https://i.ytimg.com/vi/8pLunejSTnw/maxresdefault.jpg',
               fit:BoxFit.cover),
            ),
            /*
            bottom: TabBar
            (
              //labelColor: Colors.black,
              //indicatorColor: Colors.black,
              controller: _tabController,
              tabs: <Widget>
              [
                Tab
                 (
                  text: 'Tutorials'
                 ),
                Tab
                 (
                  text: 'Gallery',
                 )
              ]
            ),*/
          );
  }
}