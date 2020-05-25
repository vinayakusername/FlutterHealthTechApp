import'package:flutter/material.dart';
import 'package:health_tech_app1/views/widget_HomeTopTab.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.child}) : super(key: key);
 
  
  final Widget child;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color PrimaryColor = Color(0xff109618);

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController
    (
      length: 5, 
      child: Scaffold
      (
         appBar: AppBar
         (
           backgroundColor: PrimaryColor,
           title: Padding
           (
             padding: EdgeInsets.all(8.0),
             child: _GooglePlayAppBar(),
           ),
           bottom: TabBar
           (
             isScrollable: true,
             indicatorColor: Colors.white,
             indicatorWeight: 6.0,
             onTap: (index)
             {
               setState(() 
               {
                  switch(index)
               {
                 case 0: 
                 PrimaryColor = Color(0xffff5722);
                 break;

                 case 1: 
                 PrimaryColor = Color(0xff3f51b5);
                 break;
                 
                 case 2: 
                 PrimaryColor = Color(0xffe91e63);
                 break;

                 case 3: 
                 PrimaryColor = Color(0xff9c279b);
                 break;

                 case 4: 
                 PrimaryColor = Color(0xff2196f3);
                 break;

                 default:
               }
               });
              
             },
             tabs: <Widget>
             [
                Tab
                (
                  child: Container
                  (
                    child: Text('Home',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                  ),
                ),

                Tab
                (
                  child: Container
                  (
                    child: Text('Games',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                  ),
                ),

                Tab
                (
                  child: Container
                  (
                    child: Text('Movies',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                  ),
                ),

                Tab
                (
                  child: Container
                  (
                    child: Text('Book',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                  ),
                ),

                Tab
                (
                  child: Container
                  (
                    child: Text('Music',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                  ),
                )
             ]
           ),
         ),

         body: TabBarView
         (
           children: <Widget>
           [
             HomeTopTabs(0xffff5722),
           ],
         ),
         
      ),
      
    );
  }

  Widget _GooglePlayAppBar()
  {
    return Container
    (
      color: Colors.white,
      child: Row
      (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>
        [
          Container
          (
             child: IconButton(icon: Icon(Icons.menu), onPressed: null),
          ),

          Container
          (
            child: Text
            (
               'Google Play',
               style: TextStyle(color:Colors.grey),
            ),
          ),
           Container
          (
             child: IconButton(icon: Icon(Icons.mic,color: Colors.blueGrey,), onPressed: null),
          ),
        ],
      ),
    );
  }
}
