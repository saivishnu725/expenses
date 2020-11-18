<<<<<<< HEAD
// import 'package:expenses/login.dart';
import 'package:expenses/newusers.dart';
=======
//import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> 8e340c8a9338a4f95b5d2e06de637331f8a77b5c
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:expenses/login.dart';
//import 'streampage.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
<<<<<<< HEAD
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expenses",
      home: AddNewUsers()));
}
=======
  
  runApp(MaterialApp (
        debugShowCheckedModeBanner: false,
        title : "Expenses",
        home  : LoginScreen()
    )
  );
}
>>>>>>> 8e340c8a9338a4f95b5d2e06de637331f8a77b5c
