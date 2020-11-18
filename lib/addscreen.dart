// import 'package:cloud_firestore/cloud_firestore.dart';

import 'streampage.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key key}) : super(key: key);
  @override
  _AddScreenState createState() => _AddScreenState();
}

var id;

class _AddScreenState extends State<AddScreen> {
  var _formkey = GlobalKey<FormState>();
  String title;
  String cost;
  TextEditingController titleController;
  TextEditingController costController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Add New Expense"),
        centerTitle: true,
      ),
      // backgroundColor: Colors.black87,
      body: Form(
        key: _formkey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // Money_img
                  // Image(image: AssetImage('assets/money.png')),
                  //Title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: titleController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter some title";
                        }
                        // return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          title = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter the title e.g.., Bank check',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.blue[800],
                        ),
                        // errorText: 'Enter some title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  // Cost
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: costController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter the cost";
                        }
                        // return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          cost = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Cost',
                        hintText: 'Enter the cost e.g., 5000',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(color: Colors.blue[800]),
                        // errorText: 'Enter the cost',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  // Date
                  Row(
                    children: [
                      //Year
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          labelText: DateTime.now().year.toString() + "(Optional)",
                          hintText: "Enter the year",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      )),
                      Container(width: 20.0,height: 20.0,),
                      // Month
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          labelText: DateTime.now().month.toString() + "(Optional)",
                          hintText: "Enter the month in numbers",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      )),
                      Container(width: 20.0,height: 20.0,),
                      // Date
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          labelText: DateTime.now().day.toString() + "(Optional)",
                          hintText: "Enter the date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      )),
                    ],
                  ),
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      )),
                      Container(
                        width: 25.0,
                      ),
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            debugPrint("Before calling func");
                            addData(title, cost);
                            debugPrint("After calling func");
                            Navigator.pop(context);
                          }
                        },
                        color: Colors.green[400],
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}