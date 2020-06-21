import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/create_quiz.dart';
import 'package:health_tech_app1/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      
           appBar: AppBar
                    (
                      title: appBar(context),
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      brightness: Brightness.light,
                      centerTitle: true,
                    ),
           body: Container
                 (
                   child: Column
                        (
                          children: <Widget>
                          [

                          ],
                        ),
                 ), 
          floatingActionButton: FloatingActionButton
                                (
                                  child: Icon(Icons.add),
                                  onPressed: ()
                                  {
                                    Navigator.push
                                         ( 
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context)=> CreateQuiz()
                                            )
                                         );
                                  }
                                ),
    );
  }
}