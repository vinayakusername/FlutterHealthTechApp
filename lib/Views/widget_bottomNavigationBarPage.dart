import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_BuyPage.dart';
import 'package:health_tech_app1/Views/widget_HomePage.dart';
import 'package:health_tech_app1/Views/widget_MojoPage.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key key, this.title}) : super(key: key);

 
  final String title;

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  

  int _currentIndex =0;
  final List<Widget> _children =
  [
    MyHomePage(),
    MojoPage(),
    BuyPage()
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      // appBar: AppBar(
       
      //   title: Text(widget.title),
      // ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
      (
        currentIndex: _currentIndex,
        items: 
        [
            BottomNavigationBarItem
            (
              icon: Icon(Icons.home,color: Colors.white,),
              title:Text('Home',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
              backgroundColor: Colors.pink
            ),

            BottomNavigationBarItem
            (
              icon: Icon(Icons.home,color: Colors.white,),
              title:Text('Mojo',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
              backgroundColor: Colors.pink
            ),

            BottomNavigationBarItem
            (
              icon: Icon(Icons.home,color: Colors.white,),
              title:Text('Buy',style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
              backgroundColor: Colors.pink
            ),
        ],
        
        onTap: onTapped,
      ),
    );
  }
   void onTapped(int index)
   {
           setState(() {
             _currentIndex = index;
           });
   }
}