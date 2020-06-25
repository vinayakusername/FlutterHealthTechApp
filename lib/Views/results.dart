import 'package:flutter/material.dart';
import 'package:health_tech_app1/widgets/widgets.dart';


class Results extends StatefulWidget {

  final int correct, incorrect, total;
  Results({@required this.correct,@required this.incorrect,@required this.total});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    ( 
    body:Container
    (
      height: MediaQuery.of(context).size.height,
      child: Center
      (
      child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            Text("${widget.correct}/${widget.total}",style: TextStyle(fontSize: 25.0),),
            SizedBox(height: 12.0,),
            Text("You answered ${widget.correct} answers correctly and ${widget.incorrect} incorrectly",
            style: TextStyle(fontSize:16.0,color: Colors.grey),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0,),
            GestureDetector
            (
              onTap: ()
              {
                Navigator.pop(context);
                
              },
              child: customButtonWidget(context:context,buttonName: "Go To Home",
                        buttonWidth: MediaQuery.of(context).size.width/2)
            )
          ],
        ),
      ),
      
    )
    );
  }
}