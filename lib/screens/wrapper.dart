import 'package:fireShouldSuceess/model/user.dart';
import 'package:fireShouldSuceess/screens/authenticate.dart/authenticate.dart';
import 'package:fireShouldSuceess/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return AuthenticateScreen();
    } else {
      return HomeScreeen();
    }
  }
}
