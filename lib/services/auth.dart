

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_me/models/user.dart';

import 'package:flutter/cupertino.dart';

class AuthService{
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = 'email';
  String password = 'password';

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(id: user.uid) : null;
  }
  Stream<UserModel?> get user {
    return auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signUp(email,password) async {
    try {
      // ignore: unused_local_variable
      User user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )) as User;
      _userFromFirebaseUser(user);
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  Future signIn(email,password) async {
    try {
      // ignore: unused_local_variable
      User user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )) as User;
      _userFromFirebaseUser(user);
    }
    on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
  Future signOut() async {
    try{
      return await auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}