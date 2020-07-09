
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/home_gallery_sub_page.dart';
import 'package:health_tech_app1/Views/home_tutorial_sub_page.dart';
import 'package:health_tech_app1/delegate/sliver_persistent_header_delegate_impl.dart';
import 'package:tuple/tuple.dart';
//import 'package:tuple/tuple.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final List<Tuple3> _pages =
  [
    Tuple3('Tutorials',HomeTutorialsSubPage(),Icon(Icons.video_library)),
    Tuple3('Gallery',HomeGallerySubPage(),Icon(Icons.image))
  ];

  TabController _tabController;

  @override
  void initState()
  {
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(()=>setState(() {}));
    super.initState();
  }

  @override
  void dispose() 
  {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
     
       body: NestedScrollView(
         headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled)
         {
           return <Widget>
           [
             HomeSliverAppBar(_pages[_tabController.index].item1),
             SliverPersistentHeader
             (
               delegate: SliverPersistentHeaderDelegateImpl
               (
               color: Colors.pink,
              tabBar: TabBar
               (
                 labelColor: Colors.white,
                 indicatorColor: Colors.white,
                 controller: _tabController,
                 tabs: _pages.map<Tab>((Tuple3 page)=> Tab(text:page.item1)).toList()
               ),
               ),
             ),
           ];
         },
         body: TabBarView
         (
           controller: _tabController,
           children: _pages.map<Widget>((Tuple3 page)=> page.item2).toList()
         ),
       ),
       /*
       bottomNavigationBar: Container
       (
         color: Colors.pink,
         child: TabBar
                 (
                   unselectedLabelColor: Colors.grey,
                   labelColor: Colors.white,
                   indicatorColor: Colors.white,
                   controller: _tabController,
                   tabs: _pages.map<Tab>((Tuple3 page)=> Tab
                   (
                     text:page.item1,
                     icon:page.item3,
                   )).toList()
                 ),
       ),*/
    );
  }
}