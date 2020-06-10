import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_AppBar.dart';
import 'package:health_tech_app1/Views/widget_HomePage.dart';

class DashBoardPage extends StatefulWidget {

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar:  AppBar
              (
               title: Container(
                        alignment: Alignment.center,
                        child: Text("DashBoard",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                 ),
                 backgroundColor: Colors.pink,
                  //elevation property is used to set elevation to AppBar in Android Device.
                 elevation: defaultTargetPlatform == TargetPlatform.android ?5.0 : 0.0,
               ),
      drawer: navigationDrawer(),         
    );
  }

  
  Widget navigationDrawer()
  {
    return new Drawer(
          // ListView is used to create  static list of items.  
          child: new ListView(
            children: <Widget>[
              //useraccountsdrawerheader is used to show user accounts details on drawer.
              new UserAccountsDrawerHeader(
                 accountName: new Text("Ganesh"),
                 accountEmail: new Text("ganesh@gmail.com"),
                 currentAccountPicture: new CircleAvatar(
                   backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                   child: new Text("G"),
                 ),
                 otherAccountsPictures: <Widget>[
                   new CircleAvatar(
                      backgroundColor: Theme.of(context).platform==TargetPlatform.iOS 
                   ? Colors.pink:Colors.white,
                      child: new Text("A"),
                   ),
                 ],
              ),
              //ListTite widget is used to create to items in list view.
              new ListTile(
                   title: new Text("Wallet"),//Text widget is used to define text.
                   leading:Icon(Icons.account_balance_wallet),
                   //onTap widget is used for providing triggering an event.
                   onTap: () {
                    // Navigator.of(context).pop(); // this statement is used to close the drawer.
                     //Navigator.of(context).pushNamed("/c"); // this statement is used navigate to specified route or page using named route='/a'.
                     },
              ),
              
               new ListTile(
                   title: new Text("Gallery Events"),
                   leading: Icon(Icons.event),
                   onTap: (){
                    // Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed("/b");
                   },
              ),

                new ListTile(
                   title: new Text("Support"),
                   leading: Icon(Icons.help),
                   onTap: (){
                     //Navigator.of(context).pop();
                     //Navigator.of(context).pushNamed("/b");
                   },
              ),
              
               new ListTile(
                   title: new Text("Edit Profile"),
                   leading: Icon(Icons.edit),
                   onTap: (){
                     Navigator.of(context).pop();
                     //Navigator.of(context).pushNamed("/c");
                      Navigator.push
                                (
                                  context, 
                                  MaterialPageRoute(builder: (context)
                                  {
                                    //return new EditProfilePage();

                                  })
                                );
                   },
              ),

               new ListTile(
                   title: new Text("Quiz"),
                   leading: Icon(Icons.question_answer),
                   onTap: (){
                    // Navigator.of(context).pop();
                     //Navigator.of(context).pushNamed("/c");
                   },
              ),
              
               new ListTile(
                   title: new Text("Search"),
                   leading: Icon(Icons.search),
                   onTap: (){
                    // Navigator.of(context).pop();
                    // Navigator.of(context).pushNamed("/c");
                   },
              ),


            // Divider widget is used for separating the items or widgets.
             // new Divider(),


               new ListTile(
                   title: new Text("SignOut"),
                   leading: Icon(Icons.lock),
                   onTap: () 
                   {
                     //Navigator.of(context).pop();
                     //exit(0);
                     HomePage().logOutMethod();
                   },
              ),
            
               new ListTile(
                   title: new Text("Close"),
                   leading: new Icon(Icons.close),//Icon widget is used to set Icons for particular items.
                   onTap: ()=> Navigator.of(context).pop(),
              ),
             
             
              SizedBox(
                height: 15.0,
              ),
              new Divider(), 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>
                        [   
                            Container
                              (
                                alignment: Alignment.topLeft,
                                child: Text("Legal",style: TextStyle(color: Colors.black,fontSize: 13.0),),
                              ) ,

                               Container
                              (
                                alignment: Alignment.topLeft,
                                child: Text("v1.0.0",style: TextStyle(color: Colors.black,fontSize: 13.0),),
                              ) ,   
                        ],
                  
                  ),
              
              ],
          ),
        );
 
  }

}