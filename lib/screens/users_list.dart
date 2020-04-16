import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:policeapp/pages/newlist.dart';
import 'package:policeapp/pages/user_tile.dart';

class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<NewList>>(context);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
        return UserTile(user: users[index]);
      },
    );
  }
}
