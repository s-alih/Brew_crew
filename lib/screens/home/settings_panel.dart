import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  List<String> sugers = ['0', '1', '2', '3', '4'];

  String _currentName;

  String _cirrentSuger;

  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Name'),
            onChanged: (value) => setState(
              () => _currentName = value,
            ),
            validator: (value) => value.isEmpty ? 'No name' : null,
          ),
          DropdownButtonFormField(
            onChanged: (value) => setState(() => _cirrentSuger = value),
            value: _cirrentSuger ?? '0',
            items: sugers.map((suger) {
              return DropdownMenuItem(
                value: suger,
                child: Text('suger $suger'),
              );
            }).toList(),
          ),
          FlatButton(
            child: Text('Submit'),
            onPressed: () {
              print(_currentName);
              print(_cirrentSuger);
            },
          )
        ],
      ),
    );
  }
}
