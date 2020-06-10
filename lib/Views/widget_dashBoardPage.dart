import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  String carModel;
  String carColor;

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
                 onPressed: ()
                 {
                   Navigator.of(context).pop();
                   Map carData = {'carName':this.carModel,'color':this.carColor};
                  //  crudObj.addData(carData).then((result)
                  //  {
                  //    dialogTrigger(context);
                  //  }). catchError((e){print(e);});
                 },
               )
             ],
           );
         }
       );
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
            )
          ],
        ),
    );
  }
}