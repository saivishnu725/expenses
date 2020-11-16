import 'package:expenses/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'streampage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (FirebaseAuth.instance.currentUser.uid != null) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Expenses",
        home: LoginPage()));
  } else {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenses",
      home: StreamPage(),
    ));
  }
}
