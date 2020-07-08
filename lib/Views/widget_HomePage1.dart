
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/home_gallery_sub_page.dart';
import 'package:health_tech_app1/Views/home_tutorial_sub_page.dart';
//import 'package:tuple/tuple.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPage =0;
  PageController _pageController = PageController();
  final _pages =
  [
    HomeTutorialsSubPage(),
    HomeGallerySubPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      
     body:NestedScrollView
     (
      headerSliverBuilder:(BuildContext contexxt,bool innerBoxIsScrolled)
      {
        return <Widget>
        [
          HomeSliverAppBar(_selectedPage == 0 ? 'Tutorial' : 'Gallery' )
        ];
      } ,
      body: PageView
       (
         children: _pages,
         onPageChanged: (index)
         {
            setState(() 
            {
              _selectedPage = index;  
            });
         },
         controller: _pageController,
       ),
     ),
      
     bottomNavigationBar: BottomNavigationBar
     (
       type: BottomNavigationBarType.shifting,

       items: 
       [
         BottomNavigationBarItem
         (
           
           icon: Icon(Icons.video_library),
           title: Text('Tutorials')
         ),
          BottomNavigationBarItem
         (
           
           icon: Icon(Icons.image),
           title: Text('Gallery')
         ),
       ],
       currentIndex: _selectedPage,
       onTap: (index)
       {
         setState(() 
         {
           _selectedPage = index; 
           _pageController.animateToPage(_selectedPage, duration: Duration(milliseconds: 300), 
             curve: Curves.bounceInOut);
         });
       },
     ),
    );
  }
}