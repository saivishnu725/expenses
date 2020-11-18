//import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:expenses/login.dart';
//import 'streampage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MaterialApp (
        debugShowCheckedModeBanner: false,
        title : "Expenses",
        home  : LoginScreen()
    )
  );
}
