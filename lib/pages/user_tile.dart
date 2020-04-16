import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:policeapp/pages/newlist.dart';

class UserTile extends StatelessWidget {

  final NewList user;

  UserTile({this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Container(
            height: 100,
          color: Colors.red[100],
          child: ListView(
//            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name: ${user.name}',style: TextStyle(fontSize: 20.0),),
              Text('Address: ${user.address}',style: TextStyle(fontSize: 20.0),),
              Text('PhoneNo: ${user.phoneNo}',style: TextStyle(fontSize: 20.0),),

            ],
          )
        )
      ),
    );
  }
}
