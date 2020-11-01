import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Expenses"),
        leading: Icon(Icons.monetization_on),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.white,
            elevation: 1.5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.arrow_forward,
              )
              ),
              title: Text("Title 1"),
              subtitle: Text("Subtitle 1"),
              trailing: Text("₹ xyz"),
            ),
          ),
        ],
      ),
    );
  }
}
