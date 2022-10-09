// @dart = 2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sql/Comm/Toast.dart';
import 'package:sql/Comm/genLoginSignupHeader.dart';
import 'package:sql/Model/UserModel.dart';
import 'LoginForm.dart';
import 'Start.dart';
import 'vote.dart';

class sure extends StatefulWidget {
  final String name;
  const sure ({Key key, this.name}) : super(key: key);
  @override
  _sureState createState() => _sureState();
}

class _sureState extends State<sure> {
  final _formKey = new GlobalKey<FormState>();
  Can can = Can();
  int vots;
  int submitted;
  final _auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  postDetailsToFirestore(int vot) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Can can = Can();
    can.votes = vot;

    await firebaseFirestore
        .collection("candidates")
        .doc(widget.name)
        .set(can.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginForm()),
            (route) => false);
  }
  postDetailsFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.nid = user.email;
    userModel.name = user.uid;
    userModel.submit = 0;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginForm()),
            (route) => false);
    alertDialog(context, 'The Data Uploaded Successfully');
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("candidates").doc(widget.name).get().then((value) {
      this.can = Can.fromMap(value.data());
      setState(() {});
    });
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genLoginSignupHeader('Submittion Confirm'),
                    Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      child: ElevatedButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
                        child: Text('Yes', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){
                        print(widget.name);
                        vots = can.votes+1;
                        postDetailsToFirestore(vots);
                        postDetailsFirestore();
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      child: ElevatedButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
                          child: Text('No', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => vote()));},
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
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
                ])),
      ),
    );
  }
}
