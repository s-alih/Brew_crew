import 'package:fireShouldSuceess/server/authinticate.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.brown[500],
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.logedOut();
              },
              icon: Icon(Icons.power),
              label: Text('logout machaa')),
        ],
      ),
    );
  }
}
