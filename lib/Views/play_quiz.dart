
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/results.dart';
import 'package:health_tech_app1/models/question_model.dart';
import 'package:health_tech_app1/services/database.dart';
import 'package:health_tech_app1/widgets/play_quiz_widgets.dart';
import 'package:health_tech_app1/widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {

  final String quizId;
  PlayQuiz(this.quizId);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total =0,_correct = 0, _incorrect = 0 , _notAttempted =0;

class _PlayQuizState extends State<PlayQuiz> {
  
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionSnapshot;


  @override
  void initState()
  {
    print("${widget.quizId}");
    databaseService.getQuizQuestionData(widget.quizId).then((val)
    {
       
      questionSnapshot = val;
      _correct = 0;
      _incorrect = 0;
      _notAttempted = 0;
      total = questionSnapshot.documents.length;
      setState(() {
        //questionSnapshot = val;
      });
    });
    super.initState();
  }

  QuestionModel getQuestionModelFromDataSnapshot(DocumentSnapshot questionSnapshot)
  {
      QuestionModel questionModel = new QuestionModel();
      
      questionModel.question = questionSnapshot.data["question"];
      List<String> options =
      [
        questionSnapshot.data["option1"],
        questionSnapshot.data["option2"],
        questionSnapshot.data["option3"],
        questionSnapshot.data["option4"],
      ];

      options.shuffle();
      questionModel.option1 = options[0];
      questionModel.option2 = options[1];
      questionModel.option3 = options[2];
      questionModel.option4 = options[3];
      questionModel.correctOption = questionSnapshot.data["option1"];
      questionModel.answered = false;

      return questionModel;
  }




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
                  iconTheme: IconThemeData(color: Colors.black87),
                  centerTitle: true,
                ),
      body: Container
      (
        child: Column
        (
          children: <Widget>
          [
            questionSnapshot == null ?
              Container
              (
                child: Center(child:CircularProgressIndicator()),
              ) :
              ListView.builder
              (
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: questionSnapshot.documents.length,
                itemBuilder: (context,index)
                {
                  return QuizPlayTile
                  (
                    questionModel:getQuestionModelFromDataSnapshot(
                                              questionSnapshot.documents[index]),
                    questionIndex:  index,
                  );
                }
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
      (
        child: Icon(Icons.check),
        onPressed: ()
        {
          Navigator.pushReplacement(
            context, MaterialPageRoute(
                                   builder: (context) => Results
                                   (
                                     correct: _correct,
                                     incorrect: _incorrect,
                                     total: total,
                                   ))
                                   );
        }
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {

  final QuestionModel questionModel;
  final int questionIndex;
  QuizPlayTile({this.questionModel,this.questionIndex});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {

   String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container
    (
       child: Column
       (
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>
         [
           Text("Q${widget.questionIndex + 1} ${widget.questionModel.question}", 
                      style: TextStyle(fontSize: 18.0,color: Colors.black87),),
           SizedBox(height: 12.0,),
          GestureDetector
          (
          onTap: ()
          {
            if(!widget.questionModel.answered)
            {
              if(widget.questionModel.option1 == widget.questionModel.correctOption)
              {
                optionSelected = widget.questionModel.option1;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;

                setState(() {});
              }
              else
              {
                 optionSelected = widget.questionModel.option1;
                 widget.questionModel.answered = true;
                 _incorrect = _incorrect + 1;
                 _notAttempted = _notAttempted -1;
                 setState(() {});
              }
            }
          } ,
          child: OptionTile
             (
               option: "A", 
               description: widget.questionModel.option1, 
               correctAnswer: widget.questionModel.correctOption, 
               optionSelected: optionSelected
             ),
           ),

           SizedBox(height: 4.0,),
           GestureDetector
           (
          onTap: ()
          {
            if(!widget.questionModel.answered)
            {
              if(widget.questionModel.option2 == widget.questionModel.correctOption)
              {
                optionSelected = widget.questionModel.option2;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;

                setState(() {});
              }
              else
              {
                 optionSelected = widget.questionModel.option2;
                 widget.questionModel.answered = true;
                 _incorrect = _incorrect + 1;
                 _notAttempted = _notAttempted -1;
                 setState(() {});
              }
            }
          } ,
            child: OptionTile
             (
               option: "B", 
               description: widget.questionModel.option2, 
               correctAnswer: widget.questionModel.correctOption, 
               optionSelected: optionSelected
             ),
           ),

           SizedBox(height: 4.0,),
           GestureDetector
           ( 
          onTap: ()
          {
            if(!widget.questionModel.answered)
            {
              if(widget.questionModel.option3 == widget.questionModel.correctOption)
              {
                optionSelected = widget.questionModel.option3;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;

                setState(() {});
              }
              else
              {
                 optionSelected = widget.questionModel.option3;
                 widget.questionModel.answered = true;
                 _incorrect = _incorrect + 1;
                 _notAttempted = _notAttempted -1;
                 setState(() {});
              }
            }
          } ,
            child: OptionTile
             (
               option: "C", 
               description: widget.questionModel.option3, 
               correctAnswer: widget.questionModel.correctOption, 
               optionSelected: optionSelected
             ),
           ),

           SizedBox(height: 4.0,),
          GestureDetector
          (
           onTap: ()
          {
            if(!widget.questionModel.answered)
            {
              if(widget.questionModel.option4 == widget.questionModel.correctOption)
              {
                optionSelected = widget.questionModel.option4;
                widget.questionModel.answered = true;
                _correct = _correct + 1;
                _notAttempted = _notAttempted - 1;

                setState(() {});
              }
              else
              {
                 optionSelected = widget.questionModel.option4;
                 widget.questionModel.answered = true;
                 _incorrect = _incorrect + 1;
                 _notAttempted = _notAttempted -1;
                 setState(() {});
              }
            }
          } ,
          child: OptionTile
             (
               option: "D", 
               description: widget.questionModel.option4, 
               correctAnswer: widget.questionModel.correctOption, 
               optionSelected: optionSelected
             ),
           ),
          SizedBox(height:20.0)
          
         ],
       ),  
    );
  }
}