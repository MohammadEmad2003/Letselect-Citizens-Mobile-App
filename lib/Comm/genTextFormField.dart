// @dart = 2.9
import 'package:flutter/material.dart';

import 'Toast.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  getTextFormField(
      {this.controller,
      this.hintName,
      this.icon,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintName';
          }
          return null;
        },
        decoration:  InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white
              )),
              focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white
              )),
          labelText: hintName,
          labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22.0),
          focusColor: Colors.white,
        ),
        style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
    );
  }
}
