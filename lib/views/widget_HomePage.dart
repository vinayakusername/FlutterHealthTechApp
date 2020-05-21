import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var myFeedbackText='Could Be Better';
  var sliderValue = 0.0;

  IconData myFeedBackData = FontAwesomeIcons.sadTear;
  Color myFeedBackColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar
      (
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){

        }),
        title: Text('FeedBack'),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.solidStar), onPressed: (){})
        ],
      ),
      
      body:Container
      (
         color: Color(0xffE5E5E5),
         child: Column
         (
           children: <Widget>
           [
             Container(
               child:Padding
               (
                 padding: const EdgeInsets.all(16.0),
                 child: Container(child:Text('On Scale of 1 to 5, how do you rate our service',
                                style: TextStyle(color: Colors.black,fontSize: 22.0,fontWeight: FontWeight.bold),
                                ),
                                ),
                
               ),

               ),

               SizedBox(height: 30.0,),
               Container(
                       child: Align
                       (
                         child: Material
                         (
                           color: Colors.white,
                           elevation: 14.0,
                           borderRadius: BorderRadius.circular(24.0),
                           shadowColor: Color(0x802196F3),
                           child: Container
                           (
                             width: 350.0,
                             height: 400,
                             child: Column(children: <Widget>[],),
                           ),
                         ),
                       ),
               ),
           ],
         ),
      ),
    );
  }
}