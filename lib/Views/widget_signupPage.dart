import 'package:flutter/material.dart';
import 'package:health_tech_app1/Services_or_Utility/usermanagement.dart';
import 'package:health_tech_app1/Views/widget_loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _email;
  String _password;

  _signup()
  {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)
                         .then((signedInUser)
                         {
                          UserManagement().storeNewUser(signedInUser,context);
                         }).catchError((e)
                         {
                           print(e);
                         });
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold
    (
      appBar: AppBar
      (
        title: Text('SignUp Page'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ), 

      body: Center
      (
        child: Container
        (
          padding: const EdgeInsets.all(25.0),
           child: Column
           (
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>
             [
                TextFormField
                (
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (value)
                  {
                    setState(() 
                    {
                       _email = value;  
                    });
                  },
                ),
                SizedBox(height: 15,),
                TextFormField
                (
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  onChanged: (value)
                  {
                    setState(() 
                    {
                       _password = value;  
                    });
                  },
                ),
                SizedBox(height:20),
                RaisedButton
                (
                  child: Text('SignUp'),
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: ()=> _signup()
                ),
                SizedBox(height:10.0),
                FlatButton
                (
                  child: Text('Already have an account? Login'),
                  textColor: Colors.pink,
                  onPressed: () 
                  {
                    Navigator.of(context).pushNamed('/landingPage');
                  }
                  
                )
             ],
           ),    
        ),
      ), 
    );
  }
  
}