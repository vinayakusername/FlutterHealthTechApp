import 'package:flutter/material.dart';

AppBar header(context,{bool isAppTitle=false,String strTitle,disappearedBackButton=false})
{
  return AppBar
  (
    iconTheme: IconThemeData
    (
      color: Colors.pink
    ),
    automaticallyImplyLeading: disappearedBackButton, 
    //automaticallyImplyLeading: disappearedBackButton ? false : true,
    title: Text
    (
      isAppTitle? "HealthTech App": strTitle,
      style: TextStyle
      (
        color: Colors.white,
        //fontWeight: isAppTitle ? FontWeight.bold : "",
        fontSize: isAppTitle ? 24.0 : 22.0
      ),
      overflow: TextOverflow.ellipsis,
      
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}