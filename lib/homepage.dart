import 'package:expenses/detailspage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Icon(
                  Icons.arrow_forward,
                )),
            title: Text("Title 1"),
            subtitle: Text("Subtitle 1"),
            trailing: Text("₹ xyz"),
            onTap: () {
              debugPrint("Showing details");
              DetailsPage();
            },
          ),
        ],
      ),
    );
  }
}
