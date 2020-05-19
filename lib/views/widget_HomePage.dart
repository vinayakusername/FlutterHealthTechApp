import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_tech_app1/views/widget_Task.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<Task> task = new List();


  @override
  void initState()
  {
    super.initState();
       setState(() 
       {
         task.add(new Task("Task1","subTask1","10:00",Colors.red));
         task.add(new Task("Task2","subTask2","11:00",Colors.green));
         task.add(new Task("Task3","subTask3","12:00",Colors.blue));
         task.add(new Task("Task4","subTask4","13:00",Colors.orange));
       });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     body:Container(

       width:MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,

       child: Stack(
         children: <Widget>
         [
            Positioned(
              child: Container
              (
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration
                (
                  color: Color(0xff5a348b),
                  gradient: LinearGradient(
                    colors: [Color(0xff8b70fe),Color(0xff2da9ef)],
                    begin: Alignment.centerRight,
                    end: Alignment(-1.0, -1.0),
                    ),
                ),
                child: _myHeaderContent(),
              ),
              
              ),

          Positioned(
            top: 160,
            left: 18.0,
            child: Container(
               color: Colors.white,
               width: 345.0,
               height: MediaQuery.of(context).size.height/1.5,
               child: ListView.builder(
                 itemCount: task.length,
                 itemBuilder: (context,position){

                            return Dismissible(
                              key: Key(task[position].toString()),
                              background: _myHiddenContainer(task[position].taskStatus), 
                              child: _myListContainer(task[position].taskName,task[position].subTask,
                                                      task[position].taskTime,task[position].taskStatus),
                              
                              onDismissed: (direction)
                              {
                                if(direction==DismissDirection.startToEnd)
                                {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(content:Text('Delete')));
                                
                                if(task.contains(task.removeAt(position)))
                                {
                                  setState(() {
                                    task.remove(task.removeAt(position));
                                  });
                                }
                                }
                                else
                                {
                                  if(direction==DismissDirection.endToStart)
                                  {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Archive'),
                                      ));
                                  }
                                }
                              },
                              );
                 }),
            ),
            ),
         ],
       ),
     ),
     
     floatingActionButton: new FloatingActionButton(
       backgroundColor: Color(0xff2da9ef),
       foregroundColor: Color(0xffffffff),
       tooltip: 'Increment',
       child: new Icon(Icons.add),
        onPressed: ()
        {
              showDialog
              (
                context: context,
                builder:(BuildContext context)
                {
                  final taskval = TextEditingController();
                  final subval = TextEditingController();
                  final tasktime = TextEditingController();

                  Color taskcolor;

                  return AlertDialog
                  (
                        title: Text('New Task'),
                        content: Container
                        (
                          height: 250.0,
                          child: Column
                          (
                              children: <Widget>
                              [
                                Container
                                (
                                   child: TextField
                                   (
                                     controller: taskval,
                                     textAlign: TextAlign.left,
                                     decoration: InputDecoration
                                     (
                                        border: InputBorder.none,
                                        hintText: 'Task Title',
                                        hintStyle: TextStyle(color:Colors.grey),
                                     ),
                                   ),
                                ),

                                Container
                                (
                                   child: TextField
                                   (
                                     controller: subval,
                                     textAlign: TextAlign.left,
                                     decoration: InputDecoration
                                     (
                                        border: InputBorder.none,
                                        hintText: 'Sub Task',
                                        hintStyle: TextStyle(color:Colors.grey),
                                     ),
                                   ),
                                ),

                                Container
                                (
                                   child: TextField
                                   (
                                     controller: tasktime,
                                     textAlign: TextAlign.left,
                                     decoration: InputDecoration
                                     (
                                        border: InputBorder.none,
                                        hintText: 'Task Time',
                                        hintStyle: TextStyle(color:Colors.grey),
                                     ),
                                   ),
                                ),

                                Container
                                (
                                    child: Row
                                    (
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>
                                      [
                                        GestureDetector
                                        (
                                          onTap: (){taskcolor = Colors.indigo;},
                                          child:Container
                                          (
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.indigo,
                                          ),
                                        ),

                                         GestureDetector
                                        (
                                          onTap: (){taskcolor = Colors.red;},
                                          child:Container
                                          (
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.red,
                                          ),
                                        ),

                                         GestureDetector
                                        (
                                          onTap: (){taskcolor = Colors.green;},
                                          child:Container
                                          (
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.green,
                                          ),
                                        ),
                                         GestureDetector
                                        (
                                          onTap: (){taskcolor = Colors.yellow;},
                                          child:Container
                                          (
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.yellow,
                                          ),
                                        ),

                                         GestureDetector
                                        (
                                          onTap: (){taskcolor = Colors.orange;},
                                          child:Container
                                          (
                                              width: 20.0,
                                              height: 20.0,
                                              color: Colors.orange,
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ],
                          ),
                          ),
                        

                        actions: <Widget>
                        [
                          RaisedButton
                          (
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.blue,
                            child: Text('Add',style: TextStyle(color:Colors.white),),
                            onPressed: ()
                            {
                              setState(() {
                                task.add(new Task(taskval.text,subval.text,tasktime.text,taskcolor));
                              });
                              Navigator.pop(context);
                            }
                          ),
                        ],
                  );
                }
              );
        },

       ),
         
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff2da9ef),
        shape: CircularNotchedRectangle(),
        child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.stickyNote),
                  color: Colors.white, 
                  onPressed: (){}
                  ),

                IconButton(
                  icon: Icon(FontAwesomeIcons.search),
                  color: Colors.white, 
                  onPressed: (){},
                  )  
              ],
        ),
      ),
    );
  }
  
  Widget _myHiddenContainer(Color taskColor){
    return Container
              (
                height: MediaQuery.of(context).size.height,
                color: taskColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>
                  [
                       Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.solidTrashAlt),
                            color: Colors.white, 
                            onPressed: (){
                              setState(() {
                                
                              });
                            }
                            ),
                       ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.archive),
                            color: Colors.white, 
                            onPressed: (){
                              setState(() {
                                
                              });
                            }
                            ),
                       ),
                  ],
                ),
              );
  }
  Widget _myListContainer(String taskName, String subTask,String taskTime,Color taskColor){

         return Padding(
           padding: const EdgeInsets.all(8.0),
           child:Container(
             height: 80.0,
             child: Material(
               color:Colors.white,
               elevation:14.0,
               shadowColor: Color(0x802196f3),
               child: Container(
                 child: Row(
                   children: <Widget>[
                    
                     Container(
                       height: 80.0,
                       width: 10.0,
                       color: taskColor,
                     ),

                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Align(
                               alignment: Alignment.topLeft,
                               child: Container(
                                    child: Text(taskName,style: 
                                     TextStyle(fontSize:24.0,
                                              color:Colors.black,
                                              fontWeight: FontWeight.bold
                                              ),
                                              ),
                               ),
                             ),

                              Align(
                               alignment: Alignment.topLeft,
                               child: Container(
                                    child: Text(subTask,style: 
                                     TextStyle(fontSize:18.0,
                                              color:Colors.black,
                                              
                                              ),
                                              ),
                               ),
                             ),
                           ],
                         ),
                         ),
                       ),

                       Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child:Text(taskTime,style:TextStyle(color:Colors.black,fontSize:18.0,))
                          ),
                          ),
                       ),

                   ],
                 ),
               ),
             ),

           ),
           );

  }

  Widget _myHeaderContent()
  {
       return Align
       (
          child: ListTile(
            leading: Text('18',style: TextStyle(fontSize: 50.0,color:Colors.amber),),
            title: Text('May',style: TextStyle(fontSize:34.0,color:Colors.white),),
            subtitle: Text('2020',style:TextStyle(fontSize:24.0,color:Colors.white)),
          ),
       );
  }
}
