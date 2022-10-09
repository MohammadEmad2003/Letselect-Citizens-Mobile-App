// @dart = 2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql/Comm/Toast.dart';
import 'package:sql/Comm/genTextFormField.dart';
import 'package:sql/Model/UserModel.dart';
import 'package:sql/Screens/LoginForm.dart';
import 'package:sql/api/local_auth_api.dart';
import 'package:sql/Screens/vote.dart';
import 'package:flutter/material.dart';
import 'package:sql/api/local_auth_api.dart';
import 'package:sql/api/local_auth_api.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key key}) : super(key: key);

  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  int submitted;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget buildButton({
    String text,
    IconData icon,
    VoidCallback onClicked,}) =>
      Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ElevatedButton.icon(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
            icon: Icon(icon, size: 26, color: Colors.red,),
            label: Text(text, style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),
            onPressed: onClicked,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          )
      );

  Widget build(BuildContext context) => Scaffold(
    body: Container(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.asset(
                    'assets/fingerprintlogo.png',
                    width: 200.0,
                  ),
                ),
                SizedBox(height: 24),
                buildButton(
                    text: 'Authenticate',
                    icon: Icons.lock_open,
                    onClicked: () async {
                      final isAuthenticated = await LocalAuthApi.authenticate();
                      if (isAuthenticated) {
                        submitted = loggedInUser.submit;
                        if(submitted == 1){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => vote()));
                      }else{alertDialog(context, "You have already submitted");}
                      }
                    }
                )
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 123, 67, 1.0),
                  Color.fromRGBO(245, 50, 111, 1.0)
                ]))
    ),
  );
}

