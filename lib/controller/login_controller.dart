import 'package:basic_ui/view/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController MobileTextController = TextEditingController();
  GlobalKey<FormState> validationKey = GlobalKey<FormState>();

  String? MobileValidation(String? s) {
    if (s!.isEmpty || s.length != 10) {
      return "please enter valid Mobile number";
    } else if (s.contains(RegExp(r'[()/N;,#+.\-]'))) {
      return "please enter valid Mobile number";
    } else {
      return null;
    }
  }

   String? emailValidation(String? val) {
    if (val!.isEmpty) {
      return "Please enter email.";
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(val)) {
      return "Please enter a valid email.";
    } else if (!val.contains(".")) {
      return "Please enter a valid email.";
    } else {
      return null;
    }
  }

  void onTap(BuildContext context) {
    if (validationKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }
}
