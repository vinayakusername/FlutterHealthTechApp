import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Services_or_Utility/crudOperationsFile1.dart';

class DashBoardPage1 extends StatefulWidget {
  @override
  _DashBoardPage1State createState() => _DashBoardPage1State();
}

class _DashBoardPage1State extends State<DashBoardPage1> {

  String carModel;
  String carColor;
  //QuerySnapshot carsInfo;
  Stream carsInfo;

  CrudOperationMethods crudObj = new CrudOperationMethods();

   _logOut()
   {
      FirebaseAuth.instance.signOut().then((value)
                                      {
                                        Navigator.of(context).pushReplacementNamed('/landingPage');
                                      })
                                     .catchError((e)
                                     {
                                       print(e);
                                     });
   }

  @override 
  void initState()
  {
    crudObj.getData().then((results)
    {
        setState(() 
        {
           carsInfo = results;  
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        title: Text('DashBoard'),
        centerTitle:true,
        backgroundColor:Colors.pink,
        actions: <Widget>
        [
          IconButton
          (
            icon: Icon(Icons.add), 
            onPressed: ()
            {
               addDialog(context);
            }
          ),
         IconButton
         (
           
           icon: Icon(Icons.settings_power,), 
           onPressed: () => _logOut()
         )
        ],
      ),
      body: _carList()
      // body:  Center
      // (
      //   child: Container
      //   (
      //     child: Column
      //     (
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>
      //       [
      //         Text('You are Logged In Successfully'),
      //         SizedBox(height:15.0),
      //         OutlineButton
      //         (
      //           borderSide: BorderSide(color:Colors.pink,style:BorderStyle.solid,width:3.0),
      //           child: Text('LogOut'),
      //           onPressed: ()=> _logOut()
      //         )
      //       ],
      //     ),
      //   ),
      // ), 
    );
  }

  Widget _carList()
  {
     if(carsInfo!=null)
     {
       return StreamBuilder
       (
         stream: carsInfo,
         builder: (context,snapshot)
         {
           return ListView.builder
           (
             itemCount: snapshot.data.documents.length,
             itemBuilder: (context,index)
             {
               if(snapshot.data == null) return CircularProgressIndicator();
               return ListTile
               (
                 title: Text(snapshot.data.documents[index].data['carName']),
                 subtitle: Text(snapshot.data.documents[index].data['color']),
                 onTap: () 
                 {
                   updateDialog(context, snapshot.data.documents[index].documentID);
                 },
                 onLongPress: ()
                 {
                   crudObj.deleteData(snapshot.data.documents[index].documentID);
                 },
               );
             }
           );
         }
       );
       /*
       return ListView.builder
       (
         itemCount: carsInfo.documents.length,
         padding: const EdgeInsets.all(8.0),
         itemBuilder:(context,index)
         {
            return ListTile
            (
              title: Text(carsInfo.documents[index].data['carName']),
              subtitle: Text(carsInfo.documents[index].data['color']),
            );
         }
       );
       */
     }
     else
     {
       return Center(child:CircularProgressIndicator());
     }
  }

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
                 child: Text('update',style: TextStyle(color:Colors.white),),
                 textColor: Colors.pink,
                 color: Colors.pink,
                 onPressed: ()
                 {
                    Navigator.of(context).pop();
                  //  Map<String,dynamic> carData = (selectedDoc,{
                  //                 'carName': this.carModel,
                  //                 'color': this.carColor
                  //                });
                   crudObj.updateData(selectedDoc,{ 
                                  'carName': this.carModel,
                                  'color': this.carColor}).then((result)
                   {
                     //dialogTrigger(context);
                     
                   }). catchError((e){print(e);});
                   //Navigator.of(context).pop();
                 },
               )
             ],
           );
         }
       );
  }

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
}