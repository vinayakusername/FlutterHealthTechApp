import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/add_question.dart';
import 'package:health_tech_app1/services/database.dart';
import 'package:health_tech_app1/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizDescription,quizTitle,quizId;
  bool _isLoading = false;

  DatabaseService databaseService = new DatabaseService();

  createQuiz() async
  {
    if(_formKey.currentState.validate())
    {
          setState(() {
                _isLoading = true;  
          });

          quizId = randomAlphaNumeric(16);
          Map<String,String> quizMap = 
          {
             "quizId" : quizId,
             "quizImageUrl" : quizImageUrl,
             "quizTitle" : quizTitle,
             "quizDescription" : quizDescription
          };
      await databaseService.addQuizData(quizMap, quizId).then((value)
      {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute
          (
            builder:(context)=> AddQuestion(quizId)
          ));

        });
      });
    }
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
       body: _isLoading ? Container
       (
         child: Center
         (
           child: CircularProgressIndicator(),
         ),
       ) 
       : Form
       (
         key: _formKey,
         child: Container
         (
           padding: EdgeInsets.symmetric(horizontal: 24),
           child: Column
           (
             children: <Widget>
             [
              
              TextFormField(
              validator: (val) => val.isEmpty ? "Enter Quiz Image Url" : null,
              decoration: InputDecoration(
                hintText: "Quiz Image Url (Optional)"
              ),
              onChanged: (val){
                quizImageUrl = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
              decoration: InputDecoration(
                hintText: "Quiz Title"
              ),
              onChanged: (val){
                quizTitle = val;
              },
            ),
            SizedBox(height: 5,),
            TextFormField(
              validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
              decoration: InputDecoration(
                  hintText: "Quiz Description"
              ),
              onChanged: (val){
               quizDescription = val;
              },
            ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  createQuiz();
                },
                child: customButtonWidget(context: context, buttonName:"Create Quiz")
              ),
              SizedBox(
                height: 60,
              ),
              
             ],
           ),
         )
       ),
    );
  }
}