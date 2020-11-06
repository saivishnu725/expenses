import 'package:firebase_core/firebase_core.dart';
import 'streampage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Title",
    home: StreamPage(),
  ));
}
