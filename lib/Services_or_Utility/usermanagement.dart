import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement
{
 Future <void> storeNewUser(user,context) async 
  {
     Firestore.instance.collection('users')
                       .add(
                         {
                           'email': user.email,
                           'userId': user.uid
                         })
                       .then((onvalue)
                       {
                         Navigator.of(context).pop();
                         Navigator.of(context).pushReplacementNamed('/dashBoardPage');
                       })
                       .catchError((e)
                       { 
                         print(e);
                       });
  }
}