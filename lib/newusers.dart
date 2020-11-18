import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/streampage.dart';
import 'package:flutter/material.dart';

class AddNewUsers extends StatefulWidget {
  AddNewUsers({Key key}) : super(key: key);

  @override
  _AddNewUsersState createState() => _AddNewUsersState();
}

Key _formKey;

class _AddNewUsersState extends State<AddNewUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New User screen(private)"),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Icon(Icons.account_box_rounded),
      ),
      backgroundColor: Colors.grey[700],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          // String mapUsers = snapshot.data.toString();
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              searchForUser("email", "pass");
              return ListTile(
                title: Text(snapshot.data.docs.elementAt(index)['email']),
              );
            },
          );
        },
      ),
    );
  }
}
