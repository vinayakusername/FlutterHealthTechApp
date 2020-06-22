import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/create_quiz.dart';
import 'package:health_tech_app1/Views/play_quiz.dart';
import 'package:health_tech_app1/services/database.dart';
import 'package:health_tech_app1/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  @override
  void initState()
  {
    databaseService.getQuizData().then((val)
    {
      setState(() {
        quizStream = val;
      });  
    });
    super.initState();
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
                      centerTitle: true,
                    ),
           body: quizList(),
                   
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

  Widget quizList()
  {
    return Container
    (
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      child: StreamBuilder
      (
        stream: quizStream,
        builder: (context,snapshot)
        {
          return snapshot.data == null ? 
                         Container() : 
                         ListView.builder
                         (
                           itemCount: snapshot.data.documents.length,
                           itemBuilder: (context,index)
                           {
                            return QuizTitle
                            (
                              imgUrl: snapshot.data.documents[index].data['quizImageUrl'],
                              title: snapshot.data.documents[index].data['quizTitle'],
                              desc: snapshot.data.documents[index].data['quizDescription'],
                              quizid: snapshot.data.documents[index].data['quizId']
                            );

                           });
        }
      ),
    );
  }
}

class QuizTitle extends StatelessWidget {

  final String imgUrl,title,desc,quizid;
  QuizTitle({@required this.imgUrl, @required this.title, @required this.desc,
   @required this.quizid});

  @override
  Widget build(BuildContext context) {

     return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PlayQuiz(quizid)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:8.0),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                imgUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width-48,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        desc,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
   
  }
}