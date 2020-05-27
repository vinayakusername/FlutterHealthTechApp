import 'package:flutter/material.dart';
import 'package:health_tech_app1/Data_Model/Data_Model_ObjectFile.dart';
import 'package:health_tech_app1/utility/DBWebService_FirebaseAuthentication.dart';
import 'package:health_tech_app1/views/widget_ForgotPassword.dart';


class LoginRegisterPage extends StatefulWidget
{
   LoginRegisterPage
   ({
     this.auth,
     this.onSignedIn
   });

   final AuthImplementation auth;
   final VoidCallback onSignedIn;
   

   @override
  _LoginRegisterState createState() =>  _LoginRegisterState();
}

//This is used to differentiate between login and register form.
enum FormType
{
  login,
  register
}
class _LoginRegisterState extends State<LoginRegisterPage>{

 // DialogBox dialogBox = new DialogBox();
  

  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email="";
  String _password="";

  
  //Methods

  bool ValidateAndSave()
  {
      final form = formKey.currentState;

      if(form.validate())
      {
        form.save();
        return true;
      } 
      else
      return false;
  }

  void ValidateAndSubmit() async
  {
         if(ValidateAndSave())
         {
           try
           {
              if(_formType == FormType.login)
              {
                String userId = await widget.auth.SignIn(_email, _password);
                dialogBox.information(context,"Congrulations","You are loggedIn successfully");
               // user_ID.setUserID(userId);
                
                print("login userId="+userId);
                //print(user_ID.getUserID());
              
              }
              else
              {
                String userId = await widget.auth.SignUp(_email, _password);
                dialogBox.information(context,"Congrulations","Your account has created successfully");
                print("Register userId="+userId);
                
              }

              widget.onSignedIn();
           }
           catch(e)
           {
              dialogBox.information(context,"Error Message", e.toString());
              print("Error:"+ e.toString());
           }
         }
  }

  void MoveToRegisterScreen()
  {
        formKey.currentState.reset();
        setState(() 
        {
           _formType = FormType.register;  
        });
  }
  
  void MoveToLoginScreen()
  {
        formKey.currentState.reset();
        setState(() 
        {
           _formType = FormType.login;  
        });
  }
  //Design Code
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar
      (
           title: Container
           (
            alignment: Alignment.center,
            child:  Text("Flutter HealthTech App",style: TextStyle(color:Colors.white,fontSize: 20.0,),),
           ),
           backgroundColor: Colors.pink,
           
      ),

      body: SingleChildScrollView(
      child:Container
      (
          margin: EdgeInsets.all(15.0),
          child: Form
          (
            key: formKey,
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createInputs()+createButtons(),
            ),
          ),
      ),),
    );
  }

  List<Widget> createInputs()
  {

     return 
     [
        SizedBox(height:10.0,),
        logo(),
        SizedBox(height:15.0),

        new TextFormField
        (
          decoration: new InputDecoration(icon:Icon(Icons.email),labelText: 'Email'),
          validator: (value)
          {
             return value.isEmpty?"Email is required":null;
          },

          onSaved: (value)
          {
           return  _email = value;
          },

        ),
        SizedBox(height:10.0,),
         new TextFormField
        (
          decoration: new InputDecoration(icon:Icon(Icons.lock),labelText: 'Password'),
          obscureText: true,
           validator: (value)
          {
             return value.isEmpty?"Password is required":null;
          },

          onSaved: (value)
          {
           return  _password = value;
          },
          
        ),
        SizedBox(height:10.0),

      ]; 
  }


   List<Widget> createButtons()
  {

    if(_formType == FormType.login)
    {
     return 
      [
        RaisedButton
        (
         child: Text("Login",style:TextStyle(color:Colors.white,fontSize:20.0)),
         //textColor: Colors.white,
         color: Colors.pink,
         onPressed: ()=>ValidateAndSubmit(),
        ),

         FlatButton
        (
           
           child: Text("Forgot Password?",style: TextStyle(fontSize:14.0),),
           textColor: Colors.pink,
           onPressed:(){ForgotPasswordPage();},
        ),

        FlatButton
        (
           child: Text("Not have an Account?Create Account",style: TextStyle(fontSize:14.0),),
           textColor: Colors.pink,
           onPressed:MoveToRegisterScreen,
        )

      ]; 
    }
    else
    {
    return 
      [
        RaisedButton
        (
         child: Text("SignUp",style:TextStyle(color:Colors.white,fontSize:20.0)),
         //textColor: Colors.white,
         color: Colors.pink,
         onPressed: ()=>ValidateAndSubmit(),
        ),

        FlatButton
        (
           child: Text("Already have an Account?Login",style: TextStyle(fontSize:14.0),),
           textColor: Colors.pink,
           onPressed:MoveToLoginScreen,
        )

      ]; 
    }
  }

  Widget logo()
  {
       return new Hero
       (
         tag: 'Hero', 
         child: new CircleAvatar
         (
            backgroundColor: Colors.transparent,
            radius: 110.0,
            child: Image.asset("images/login_photo.jpg"),
         ),
         );
  }
}
