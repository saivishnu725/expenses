import 'package:expenses/streampage.dart';
import 'package:flutter/material.dart';

String email = 'saivishnu725@gmail.com';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: Icon(Icons.account_box_rounded),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter the email",
                      hintText: "example.123@example.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter the password.",
                      hintText: "1234_eXample",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StreamPage();
                      }));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text('Sign up here if you are new.'),
                    hoverColor: Colors.blue,
                    elevation: 10.0,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return StreamPage();
                        // TODO: Open signup page.
                      }));
                      print('working');
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
