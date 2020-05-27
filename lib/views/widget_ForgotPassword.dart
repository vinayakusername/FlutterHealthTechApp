import 'package:flutter/material.dart';
import 'package:health_tech_app1/views/widget_LoginRegisterPage1.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  String _email='';
 
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
            //key: formKey,
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
        // SizedBox(height:10.0,),
        //  new TextFormField
        // (
        //   decoration: new InputDecoration(icon:Icon(Icons.lock),labelText: 'Password'),
        //   obscureText: true,
        //    validator: (value)
        //   {
        //      return value.isEmpty?"Password is required":null;
        //   },

        //   onSaved: (value)
        //   {
        //    return  _password = value;
        //   },
          
        // ),
        SizedBox(height:10.0),

      ]; 
  }


   List<Widget> createButtons()
  {

   
     return 
      [
        RaisedButton
        (
         child: Text("Submit",style:TextStyle(color:Colors.white,fontSize:20.0)),
         //textColor: Colors.white,
         color: Colors.pink,
         //onPressed: ()=>ValidateAndSubmit(),
         onPressed: (){},
        ),

       

        // FlatButton
        // (
        //    child: Text("Not have an Account?Create Account",style: TextStyle(fontSize:14.0),),
        //    textColor: Colors.pink,
        //    onPressed:MoveToRegisterScreen,
        // )

      ]; 
    
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