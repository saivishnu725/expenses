import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //List a = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List a = List.generate(15, (index) => index.toString());
  
  @override
  Widget build(BuildContext context) {
  
    return ListView.builder (
      itemCount : 15,
      padding   : EdgeInsets.all(5.0),
            
      itemBuilder: (context, index) {
        return ListTile (
           title     : Text(a[index]),
           subtitle  : Text(a[index]),
           leading   : Icon(Icons.arrow_forward),
           trailing  : Icon(Icons.arrow_back)
        );    
      },
    );
  }
}
