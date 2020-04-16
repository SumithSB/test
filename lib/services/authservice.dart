import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:policeapp/screens/dashboard.dart';
import 'package:policeapp/screens/loginpage.dart';
import 'package:policeapp/services/user.dart';
import 'package:policeapp/services/databaseService.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;




  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }


  Stream<User> get user{
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);

  }

  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return DashboardPage();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign out
  signOut() {
   _auth.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds) async {
    try {
      AuthResult result = await _auth.signInWithCredential(authCreds);
      FirebaseUser user = result.user;
      //creating new document with uid
      await DatabaseService(uid: user.uid).updateUserData('Sumo', 'abcd', '9449008920');
      print('hello');
      print(user.uid);
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}
