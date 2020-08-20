import 'package:fireShouldSuceess/model/user.dart';
import 'package:fireShouldSuceess/screens/wrapper.dart';
import 'package:fireShouldSuceess/server/authinticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user, child: MaterialApp(home: Wrapper()));
  }
}
