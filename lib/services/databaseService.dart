import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:policeapp/pages/newlist.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String name, String address, String phoneNo) async {
    return await usersCollection
        .document(uid)
        .setData({'name': name, 'address': address, 'phoneNo': phoneNo});
  }
  // list of users
  List<NewList> _newListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return NewList(
        name: doc.data['name'] ?? '',
        address: doc.data['address'] ?? '',
        phoneNo: doc.data['phoneNo'] ?? ''
      );
    }).toList();
  }


  //get user details
  Stream<List<NewList>> get users {
    return usersCollection.snapshots()
    .map(_newListFromSnapshot);
  }
}
