// @ dart = 2.9
import 'package:flutter/material.dart';
import 'package:sql/Screens/LoginForm.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  'assets/vottinglogo.png',
                  width: 200.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Let's",
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text("elect",
                      style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(245, 48, 111, 1.0)))
                ],
              ),
              Text('Be Home Be Safe',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 50.0),
                          child: ElevatedButton(
                              onPressed: () {
                                print(
                                    "Election Results : candidate 1 vots = 0, candidate 2 vots = 1");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginForm()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shadowColor: MaterialStateProperty.all(
                                      Color.fromRGBO(0, 0, 0, 0))),
                              child: Text("Get Started",
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)))))),
              SizedBox(
                height: 220.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/nilelogo.png',
                    width: 100.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor: MaterialStateProperty.all(
                              Color.fromRGBO(0, 0, 0, 0))),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text("Made by Sondos Ahmed",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white)),
                            Text(
                              "Mohammad Emad",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            )
                          ],
                        ),
                      ))
                ],
              )
            ],
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
    ));
  }
}
