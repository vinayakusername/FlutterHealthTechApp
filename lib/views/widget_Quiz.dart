import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget
{

  @override
  _QuizPageState createState()=>new _QuizPageState();
 }

 class _QuizPageState extends State<QuizPage>
 {
   
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
     appBar: new AppBar(
       title: new Text('Quiz Page'),
     ),
     body: Container
             (
                alignment: Alignment.center,
                child: Text("MY Quiz Page",style: TextStyle(color: Colors.black,fontSize: 20.0),),
             ) ,
    );
  }
  
}