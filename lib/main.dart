import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fire_login/screens/login.dart';
import 'package:flutter_fire_login/screens/main.dart';
import 'package:flutter_fire_login/screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Firebase Auth",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: _handleCurrentScreen(),
    );
  }

  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new SplashScreen();
        } else {
          if (snapshot.hasData) {
            return new MainScreen(
                uid: snapshot.data.uid);
          }
          return new LoginScreen();
        }
      }
    );
}

}