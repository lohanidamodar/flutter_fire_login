import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  FirebaseAuth fAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  String uid;

  MainScreen({this.uid});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Main"),
        ),
        body: RaisedButton(
          onPressed: _signOut,
          child: Text("Log out"),
        )
      );
    }

  _signOut() async {
    await googleSignIn.signOut();
    await fAuth.signOut();
  }
}