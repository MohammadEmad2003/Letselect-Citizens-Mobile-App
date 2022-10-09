// @dart = 2.9
import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40.0),
          ),
          SizedBox(height: 10.0),
          Image.asset(
            "assets/vottinglogo.png",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
