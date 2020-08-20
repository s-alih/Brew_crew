import 'package:fireShouldSuceess/screens/authenticate.dart/register.dart';
import 'package:fireShouldSuceess/screens/authenticate.dart/signIn.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool signBool = true;
  void toggleView() {
    setState(() {
      signBool = !signBool;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signBool == true) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
