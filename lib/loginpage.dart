import 'package:expenses/streampage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

UserCredential userCredential;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @protected
  @mustCallSuper
  @override
  void initState() {
    super.initState();
    signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text("Login here"),
        leading: Icon(Icons.login),
      ),
      backgroundColor: Colors.black,
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 150.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Click here to continue",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: SignInButton(Buttons.GoogleDark, onPressed: () async {
                  debugPrint("SignIn With Google");
                  userCredential = await signInWithGoogle();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    debugPrint("StreamPage()");
                    return StreamPage();
                  }));
                }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

void signOut() async {
  GoogleSignIn().signOut();
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final GoogleAuthCredential googleAuthCredential =
      GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // image = Image.network(userCredential.user.photoURL);
  return await FirebaseAuth.instance.signInWithCredential(googleAuthCredential);
}
