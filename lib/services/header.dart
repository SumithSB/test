import 'package:flutter/material.dart';

import 'authservice.dart';

header(context,{bool isAppTitle = false,String titleText,removeBackButton = false,isAction = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? "COVID-19" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontSize: isAppTitle ? 30.0 : 22.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.redAccent,
      actions: isAction ? <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.person),
              Text("Sign-Out")
            ],
          ),
          onPressed: (){
            AuthService().signOut();
          },
        )
    ] : null,

  );
}
