import 'package:flutter/material.dart';

Widget appBar(BuildContext context)
{
   return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: 22,
            
        ),
        children: <TextSpan>[
          TextSpan(text: 'Quiz', style: TextStyle(fontWeight: FontWeight.w600
              , color: Colors.deepPurple)),
          TextSpan(text: 'App', style: TextStyle(fontWeight: FontWeight.w600
              , color: Colors.pink)),
        ],
      ),
    );
}

Widget customButtonWidget({BuildContext context,String buttonName, buttonWidth})
{
    return Container
             (
               padding: EdgeInsets.symmetric(vertical: 16.0),
               decoration: BoxDecoration
               (
                 color: Colors.pink,
                 borderRadius: BorderRadius.circular(30)
               ),
               width: buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width-48,
               child: Text(buttonName,style: TextStyle(color:Colors.white,fontSize:16),),
               alignment: Alignment.center,
             );
}