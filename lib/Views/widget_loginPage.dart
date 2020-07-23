import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tech_app1/Views/widget_signupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  _signIn()
  {
    FirebaseAuth.instance.signInWithEmailAndPassword
    (
      email: _email, 
      password: _password
    ).then((onValue)
     {
       //Navigator.of(context).pushReplacementNamed('/dashBoardPage');
      Navigator.of(context).pushReplacementNamed('/buyProductPage');
    })
     .catchError((e)
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
        title: Text('Login Page'),
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
                  child: Text('Login'),
                  color: Colors.pink,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: ()=>_signIn()
                ),
                SizedBox(height:10.0),
                FlatButton
                (
                  
                  child: Text('Don\'t have an account? SignUp'),
                  textColor: Colors.pink,
                  onPressed: ()
                  {
                    //SignUpPage();
                    Navigator.of(context).pushNamed('/signup');
                  }, 
                  
                )
             ],
           ),    
        ),
      ), 
    );
  }
}