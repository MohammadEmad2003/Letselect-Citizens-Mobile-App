// @dart = 2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sql/Comm/Toast.dart';
import 'package:sql/Comm/genLoginSignupHeader.dart';
import 'package:sql/Screens/fingerprint.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _conUserName = TextEditingController();
  final _conNationalID = TextEditingController();
  final _auth = FirebaseAuth.instance;
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          print("Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => FingerprintPage())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            alertDialog(context, "Your email address appears to be malformed");
            break;
          case "wrong-password":
            alertDialog(context, "Your password is wrong");
            break;
          case "user-not-found":
            alertDialog(context, "User with this email doesn't exist");
            break;
          case "user-disabled":
            alertDialog(context, "User with this email has been disabled");
            break;
          case "too-many-requests":
            alertDialog(context, "Too many requests");
            break;
          case "operation-not-allowed":
            alertDialog(context, "Signing in with Email and Password is not enabled");
            break;
          default:
            alertDialog(context, "An undefined Error happened.");
        }
        alertDialog(context, error.code);
      }
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final username = Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:TextFormField(
        autofocus: false,
        controller: _conUserName,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Please Enter Your Name");
          }
          // reg expression for email validation
          return null;
        },
        onSaved: (value) {
          _conUserName.text = value;
        },
        textInputAction: TextInputAction.next,
          decoration:  InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            labelText: "Name",
            labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22.0),
            focusColor: Colors.white,
          ),
          style: TextStyle(color: Colors.white, fontSize: 22.0),));
    final nationalid = Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:TextFormField(
        autofocus: false,
        controller: _conNationalID,
        validator: (value) {
          if (value.isEmpty) {
            return ("Password is required for login");
          }

        },
        onSaved: (value) {
          _conNationalID.text = value;
        },
        textInputAction: TextInputAction.done,
          decoration:  InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white
                )),
            labelText: "National ID",
            labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22.0),
            focusColor: Colors.white,
          ),
          style: TextStyle(color: Colors.white, fontSize: 22.0),));

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
                      genLoginSignupHeader('Enter your Data'),
                      username,
                      SizedBox(height: 10.0),
                      nationalid,
                      Container(
                        margin: EdgeInsets.all(30.0),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
                          child: Text('Continue', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          onPressed: (){
                            String nationalid = _conNationalID.text;
                            int x = int.parse(nationalid[0]);
                            int t = int.parse(nationalid[1]);
                            int u = int.parse(nationalid[2]);
                            int v = u+(t*10);
                            int b = 2021-(2000+v);
                            print(b);
                            if(b >= 18 || x < 3){
                            String id = _conNationalID.text + "@letselect.com";
                            signIn(id, _conUserName.text);}
                            else{alertDialog(context, 'You are under the eligible age');}
                            },
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
        )
    );
  }
}