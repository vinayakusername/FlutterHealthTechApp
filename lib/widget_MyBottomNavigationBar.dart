import 'package:flutter/material.dart';
import 'package:health_tech_app1/widget_BuyPage.dart';
import 'package:health_tech_app1/widget_HomePage.dart';
import 'package:health_tech_app1/widget_MojoPage.dart';


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
              icon: Icon(Icons.home),
              title: Text('Home')
            ),

            BottomNavigationBarItem
            (
              icon: Icon(Icons.gif),
              title: Text('MOJO')
            ),

            BottomNavigationBarItem
            (
              icon: Icon(Icons.shopping_cart),
              title: Text('Buy')
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
