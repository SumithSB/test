import 'package:flutter/material.dart';
import 'package:policeapp/pages/profile_details.dart';
import 'package:policeapp/services/header.dart';
import 'package:provider/provider.dart';
import 'package:policeapp/services/databaseService.dart';
import 'package:policeapp/screens/users_list.dart';
import 'package:policeapp/pages/newlist.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NewList>>.value(
      value: DatabaseService().users,
      child: Scaffold(
          appBar: header(context, titleText: 'Home',isAction: true),
          body: UsersList(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.redAccent,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdateProfile()));
            },
          ),

      ),
    );
  }
}
