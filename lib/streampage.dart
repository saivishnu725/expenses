import 'addscreen.dart';
import 'editscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  StreamPage({Key key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

String editTitle;
String editCost;
String deleteID;

class _StreamPageState extends State<StreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text("Expenses"),
        leading: Icon(Icons.monetization_on),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                debugPrint("Add");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddScreen();
                }));
              }),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data.docs.elementAt(index)['title']),
                  subtitle: Text(
                      snapshot.data.docs.elementAt(index)['cost'].toString()),
                  onTap: () {
                    setState(() {
                      editTitle = snapshot.data.docs.elementAt(index)['title'];
                      editCost = snapshot.data.docs
                          .elementAt(index)['cost']
                          .toString();
                      deleteID = snapshot.data.docs.elementAt(index).id;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditScreen();
                    }));
                  },
                  // addData('sampletitle', '7222558'),
                  leading: RaisedButton(
                      child: Icon(Icons.delete_forever),
                      color: Colors.white,
                      elevation: 0.0,
                      onPressed: () async {
                        // snapshot.data.docs.elementAt(index).id
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
                                      deleteProduc(snapshot.data.docs
                                          .elementAt(index)
                                          .id);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            }

                            return showBox();
                          },
                        );
                      }),
                );
              },
            );
          } else {
            return Column(
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                ),
                Expanded(child: Center(child: CircularProgressIndicator())),
                Row(
                  children: [
                    Text(
                        'Please wait for the data to load or check your internet connection.')
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

//                 Text(snapshot.data.docs.elementAt(1)['cost'].toString()),

// Future<Widget> deleteProducWidget(
//     String id, String delTitle, BuildContext context) async {
//   return AlertDialog(
//     title: Text('Are you sure you want to delete \' $delTitle \' '),
//     actions: [
//       FlatButton(
//         child: Text('Cancel'),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       FlatButton(
//         child: Text('Delete'),
//         onPressed: () async {
//           await FirebaseFirestore.instance.collection('data').doc(id).delete();
//         },
//       ),
//     ],
//   );
//   // await FirebaseFirestore.instance.collection('data').doc(id).delete();
// }

Future<void> deleteProduc(String id) async {
  await FirebaseFirestore.instance.collection('data').doc(id).delete();
}

Future<void> addData(String titleValue, var costValue) async {
  debugPrint("Before adding data");
  await FirebaseFirestore.instance.collection('data').add({
    'title': titleValue,
    'cost': costValue,
  });
  debugPrint("After adding data!!");
}
