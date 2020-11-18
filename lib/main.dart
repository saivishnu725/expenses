// import 'package:expenses/login.dart';
import 'package:expenses/newusers.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'streampage.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenses",
      home: AddNewUsers()));
}