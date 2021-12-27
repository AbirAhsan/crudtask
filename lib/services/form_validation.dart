import 'package:flutter/material.dart';

bool validateAndSave(GlobalKey<FormState> globalFormKey) {
  final form = globalFormKey.currentState;
  if (form!.validate()) {
    form.save();
    return true;
  }
  return false;
}

bool validateEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(pattern);
  return (regExp.hasMatch(email)) ? true : false;
}
