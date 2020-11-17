import 'package:expenses/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'streampage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loggedIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  loggedIn = pref.getBool('isLoggedIn');
  if (pref.getBool('isLoggedIn') == null) {
    pref.setBool('isLoggedIn', false);
  }
  if (FirebaseAuth.instance.currentUser.uid != null) {
    await pref.setBool('isLoggedIn', false);
  } else {
    await pref.setBool('isLoggedIn', true);
  }
  if (pref.getBool('isLoggedIn')) {
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "Expenses", home: LoginPage()));
  } else {
    await Firebase.initializeApp();
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Expenses",
        home: StreamPage()));
  // }
}
