import 'package:flutter/material.dart';

class TestClass extends StatefulWidget {
  TestClass({Key key}) : super(key: key);

  @override
  _TestClassState createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton.icon(
            // onPressed: () {
            //   debugPrint("onPressed clicked");
            //   showSnackBar(context);
            //   debugPrint("Task success");
            // },
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  Widget showBox() {
                    return AlertDialog(
                      title: Text("Are you sure?"),
                      actions: [
                        RaisedButton(
                            child: Text("Cancel"),
                            color: Colors.red,
                            onPressed: () {
                              debugPrint("Cancel");
                              Navigator.pop(context);
                            }),
                        RaisedButton(
                          child: Text("Okay"),
                          color: Colors.green,
                          onPressed: () {
                            debugPrint("Okay");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }

                  return showBox();
                },
              );
            },
            icon: Icon(Icons.ac_unit),
            label: Text("Alert")),
      ],
    );
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text('Hello, Coflutter!'),
    backgroundColor: const Color(0xffae00f0),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
        label: 'Done',
        textColor: Colors.white,
        onPressed: () {
          print('Done pressed!');
        }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
