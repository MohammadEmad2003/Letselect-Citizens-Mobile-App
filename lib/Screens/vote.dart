// @dart = 2.9
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sql/Comm/genLoginSignupHeader.dart';
import 'package:sql/Screens/sure.dart';

class vote extends StatefulWidget {
  @override
  _vote createState() => _vote();
}

class _vote extends State<vote> {
  final _formKey = new GlobalKey<FormState>();
  String name = 'can1';
  @override
  void initState() {
    super.initState();
  }

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    genLoginSignupHeader('Election page'),
                    //Update
                    Image.asset(
                      'assets/personslogo.jpg',
                      width: 130.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value){
                      setState(() {
                        name = 'can1';
                        _value = value;
                      });
                    },
                    ),
                      Text('candidate 1', style: TextStyle(color: Colors.white),)
                    ]),
                    Image.asset(
                      'assets/personflogo.jpg',
                      width: 130.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              name = 'can2';
                              _value = value;
                            });
                          },
                        ),
                          Text('candidate 2', style: TextStyle(color: Colors.white),
                          )
                        ]),
                    Container(
                      margin: EdgeInsets.all(30.0),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            shadowColor: MaterialStateProperty.all(Color.fromRGBO(0, 0, 0, 0))),
                        child: Text('Submit', style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sure(name: name)));
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
                  ]))
      ),
    );
  }
}
