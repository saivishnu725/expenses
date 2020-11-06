import 'package:flutter/material.dart';
import 'streampage.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

var id;

class _EditScreenState extends State<EditScreen> {
  var _formkey = GlobalKey<FormState>();
  String title = 'fe';
  String cost = '5';
  TextEditingController titleController;
  TextEditingController costController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Edit The note!!"),
        centerTitle: true,
      ),
      // backgroundColor: Colors.black87,
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                        labelText: editTitle,
                        hintText: 'Title',
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
                        labelText: editCost,
                        hintText: 'Cost',
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

                  Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                        onPressed: () {
                          deleteProduc(deleteID, editTitle,context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return StreamPage();
                          }));
                        },
                        color: Colors.red,
                        child: Text(
                          'Delete',
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
                          'Update',
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
