

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = 'email';
  String password = 'password';

  void signUpAction() async {
    try {
  // ignore: unused_local_variable
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  void signInAction() async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      backgroundColor: Colors.blue,
      elevation: 8,
      title: Text("Signup"),
     ),
     body: Container(
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Form(
        child: Column(
          children: [
            TextFormField(
            onChanged: (val) => setState(() {
              email = val;
            }),
          ),
            TextFormField(
              
              onChanged: (val) => setState(() {
                password = val;
              }),
            ),
            ElevatedButton(

              onPressed: () async => {
                signUpAction(),
              }, 
              child: Text("signup")),
            ElevatedButton(
              onPressed: () async => {
                signInAction(),
              }, 
              child: Text("signin")),
              
          ],
          )
        ),
     ),
    );
  }
}