import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class HomeTutorialsSubPage extends StatefulWidget {
  @override
  _HomeTutorialsSubPageState createState() => _HomeTutorialsSubPageState();
}

class _HomeTutorialsSubPageState extends State<HomeTutorialsSubPage> {
  
   static const List<Tuple2> tutorials =
  [
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/02/1_8_tabbar_banner_sk.jpg',
      'Flutter Tutorial1' 
    ),
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/03/1_10_image_carousel_sk.jpg',
      'Flutter Tutorial2' 
    ),
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/03/1_9_gridview_slivergrid_sk.jpg',
      'Flutter Tutorial3' 
    ),

    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/03/1_11_hero_animation_sk.jpg',
      'Flutter Tutorial4' 
    ),
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/02/1_7_pageview_banner_sk_final.jpg',
      'Flutter Tutorial5' 
    ),
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/04/1_12_video_player_sk.jpg',
      'Flutter Tutorial6' 
    ),
    const Tuple2 <String,String> 
    (
      'https://himdeve.com/wp-content/uploads/2020/01/1_4_drawer_sk_banner_final.jpg',
      'Flutter Tutorial7' 
    )
   
  ];


  @override
  Widget build(BuildContext context) {
    return CustomScrollView
    (
        slivers: <Widget>
        [
          //HomeSliverAppBar('Tutorials'),
          _buildSliverListContent()
         
        ],
    );
  }

//This sliverlist will build ondemand list or dynamic list
 SliverList _buildSliverListContent()
 {
   return  SliverList
          (
            delegate: SliverChildBuilderDelegate
            (
              (BuildContext context,int index)
              {
                return _buildListItem(tutorials[index]);
              },
              childCount: tutorials.length
            ),
          );
 }

 Card _buildListItem(Tuple2 tutorial)
 {
     return Card
     (
       margin: const EdgeInsets.all(5.0),
       child: Row
       (
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>
         [
           Image
           (
             image: NetworkImage(tutorial.item1,scale: 12.0)
           ),
           Expanded
           (
          child: Padding
             (
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top:0),
              child: Text
               (
                 tutorial.item2,
                 style: TextStyle(fontSize:20,fontWeight:FontWeight.bold ),
               ),
             ),
           ),
           
         ],
       ),
     );
 }
}

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