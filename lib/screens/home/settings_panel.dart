import 'package:fireShouldSuceess/model/user.dart';
import 'package:fireShouldSuceess/server/database.dart';
import 'package:fireShouldSuceess/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> sugers = ['0', '1', '2', '3', '4'];

  String _currentName;

  String _cirrentSuger;

  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).dataUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: userData.name,
                    onChanged: (value) => setState(
                      () => _currentName = value,
                    ),
                    validator: (value) => value.isEmpty ? 'No name' : null,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) => setState(() => _cirrentSuger = value),
                    value: _cirrentSuger ?? userData.suger,
                    items: sugers.map((suger) {
                      return DropdownMenuItem(
                        value: suger,
                        child: Text('suger $suger'),
                      );
                    }).toList(),
                  ),
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    activeColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    onChanged: (value) =>
                        setState(() => _currentStrength = value.round()),
                  ),
                  FlatButton(
                    child: Text('Submit'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateData(
                            _cirrentSuger ?? userData.suger,
                            _currentName ?? userData.name,
                            _currentStrength ?? userData.strength);
                        Navigator.pop(context);
                      } else {
                        return;
                      }
                    },
                  )
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
