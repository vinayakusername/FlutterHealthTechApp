import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Services_or_Utility/crudOperation.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  String carModel;
  String carColor;

  //QuerySnapshot carsInfo;
  Stream carsInfo;
  CrudMethods crudObj = CrudMethods();

  Future<bool>addDialog(BuildContext context) async 
  {
       return showDialog
       (
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context)
         {
           return AlertDialog
           (
             title: Text('Add Data',style:TextStyle(fontSize: 15.0)),
             content: Column
             (
               children: <Widget>
               [
                 TextField(
                           decoration: InputDecoration(hintText: "Enter Car Name"),
                           onChanged: (value){this.carModel=value;},
                          ),
                SizedBox(height: 5.0,),

                TextField(
                           decoration: InputDecoration(hintText: "Enter Car Color"),
                           onChanged: (value){this.carColor=value;},
                          ),

               ],
             ),
             actions: <Widget>
             [
               FlatButton
               (
                 child: Text('Add',style: TextStyle(color:Colors.white),),
                 textColor: Colors.pink,
                 color: Colors.pink,
                 onPressed: ()
                 {
                   //Navigator.of(context).pop();
                   Map<String,dynamic> carData = {
                                  'carName': this.carModel,
                                  'color': this.carColor
                                 };
                   crudObj.addData(carData).then((result)
                   {
                     dialogTrigger(context);
                     
                   }). catchError((e){print(e);});
                   Navigator.of(context).pop();
                 },
               )
             ],
           );
         }
       );
  }

  
/*
   Future<bool>updateDialog(BuildContext context,selectedDoc) async 
  {
       return showDialog
       (
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context)
         {
           return AlertDialog
           (
             title: Text('Update Data',style:TextStyle(fontSize: 15.0)),
             content: Column
             (
               children: <Widget>
               [
                 TextField(
                           decoration: InputDecoration(hintText: "Enter Car Name"),
                           onChanged: (value){this.carModel=value;},
                          ),
                SizedBox(height: 5.0,),

                TextField(
                           decoration: InputDecoration(hintText: "Enter Car Color"),
                           onChanged: (value){this.carColor=value;},
                          ),

               ],
             ),
             actions: <Widget>
             [
               FlatButton
               (
                 child: Text('Update',style: TextStyle(color:Colors.white),),
                 textColor: Colors.pink,
                 onPressed: ()
                 {
                   Navigator.of(context).pop();
                   Map carData = {
                                  'carName':this.carModel,
                                  'color':this.carColor
                                 };
                   crudObj.updateData(selectedDoc,carData).then((result)
                   {
                     //dialogTrigger(context);
                   }). catchError((e){print(e);});
                 },
               )
             ],
           );
         }
       );
  }

*/
  Future <bool> dialogTrigger(BuildContext context) async
  {
       return showDialog
       (
         context: context,
         barrierDismissible: false,
         builder: (BuildContext context)
         {
           return AlertDialog
           (
              title: Text("Job Done",style:TextStyle(fontSize: 15.0)),
              content: Text("Your Data is Successfully added"),
              actions: <Widget>
              [
                FlatButton
                (
                  child: Text("Alright"),
                  textColor: Colors.pink,
                  onPressed: (){Navigator.of(context).pop();} 
                  
                )
              ],
           );
         }
         
       );
  }


  @override
  void initState()
  {
   
    crudObj.getData().then(( results)
      {
          setState(() {
            carsInfo = results;
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
          title: Text("DashBoard"),
          centerTitle: true,
          actions: <Widget>
          [
            IconButton
            (
              icon: Icon(Icons.add), 
              onPressed: ()=> addDialog(context)
            ),
             IconButton
            (
              icon: Icon(Icons.refresh), 
              onPressed: ()
              {
                 crudObj.getData().then(( results)
                 {
                   setState(() {
                              carsInfo = results;
                              });
                });
              }
            )
          ],
        ),

       // body: _carInfoList(),
    );
  }

  Widget _carInfoList()
  {
    
    if(carsInfo != null)
    {
      return StreamBuilder
      (
        stream: carsInfo,
        builder: (context,snapshots)
        {
            ListView.builder
                    (
                          itemCount: snapshots.data.documents.length,
                          padding: EdgeInsets.all(5.0),
                          itemBuilder: (context,index)
                           {
                              return ListTile
                                   (
                                     title: Text(snapshots.data.documents[index].data['carName']),
                                     subtitle: Text(snapshots.data.documents[index].data['color']),
                                     onTap: ()
                                     {
                                        // updateDialog(context, snapshots.data.documents[index]);
                                     },
                                   );
                           },
                     );
        });
     
    }
    else
    {
      return Text("Loading,Please wait...");
    }

  //  /*
  //   return StreamBuilder
  //   (
  //     stream: Firestore.instance.collection('CarInfo').snapshots(),
  //     builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshots)
  //     {
  //        if(!snapshots.hasData)
  //        {
  //          return Text('Loading...,Please Wait');
  //        }
  //        else
  //        {
  //          return ListView
  //          (
  //            children: snapshots.data.documents.map((documents){

  //              return ListTile
  //              (
  //                title: Text(documents['carName']),
  //                subtitle: Text(documents['color']),
  //              ); 
  //            }).toList()
  //          );
  //        }
  //     }
  //   );*/
   } 
}