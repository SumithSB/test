import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;

  User({
    this.uid,
  });
//  factory User.fromDocument(DocumentSnapshot doc){
//    return User(
//      uid: doc['uid'],
//
//    );
//  }

}
