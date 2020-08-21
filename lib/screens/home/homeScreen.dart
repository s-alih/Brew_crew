import 'package:fireShouldSuceess/model/brew.dart';
import 'package:fireShouldSuceess/screens/home/settings_panel.dart';
import 'package:fireShouldSuceess/server/authinticate.dart';
import 'package:fireShouldSuceess/server/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './brewList.dart';

class HomeScreeen extends StatefulWidget {
  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPannel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(20),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brew,
      child: Scaffold(
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
            FlatButton.icon(
                onPressed: () => _showSettingsPannel(),
                icon: Icon(Icons.settings),
                label: Text('Settings'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
