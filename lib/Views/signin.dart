import 'package:flutter/material.dart';
import 'package:health_tech_app1/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email,password;

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
     ),

     body: Form(
       key: _formKey,
     child:Container
     (
       margin: EdgeInsets.symmetric(horizontal: 24.0),
       child: Column
       (
         children: <Widget>
         [
           Spacer(),
           TextFormField
           (
             validator: (val){return val.isEmpty ? "Enter Email Id": null;},
             decoration: InputDecoration(hintText: "Email"),
             onChanged: (val)
             {
               email = val;
             },
           ),
           SizedBox(height: 6.0,),
            TextFormField
           (
             validator: (val){return val.isEmpty ? "Enter Password": null;},
             decoration: InputDecoration(hintText: "Password"),
             onChanged: (val)
             {
               password = val;
             },
           ),
           SizedBox(height:24.0),
           Container
           (
             padding: EdgeInsets.symmetric(vertical: 16.0),
             decoration: BoxDecoration
             (
               color: Colors.pink,
               borderRadius: BorderRadius.circular(30)
             ),
             width: MediaQuery.of(context).size.width-48,
             child: Text("Sign In",style: TextStyle(color:Colors.white,fontSize:16),),
             alignment: Alignment.center,
           ),
           
            SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 17)),
                      Text("Sign Up",style:
                              TextStyle(color: Colors.black87, fontSize: 17,
                              decoration: TextDecoration.underline)),
                    ],
                  ),
           SizedBox(height:80.0)
         ],
       ),
     ),
     )
    );
  }
}