import 'package:flutter/material.dart';
//It is a incomplete code.
class DialogBox
{
  information(BuildContext context,String title,String description)
  {
    return showDialog
    (
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context)
      {
         return AlertDialog
         (
            title: Text(title),
            content: SingleChildScrollView
            (
              child: ListBody
              (
                children: <Widget>
                [
                  Text(description),
                ],
              ),
            ),

            actions: <Widget>
            [
              FlatButton
              (
                 child: Text("OK"),
                 onPressed: ()
                 {
                      return Navigator.pop(context);
                 },
              )
            ],
         );
      }
    );
  }
}