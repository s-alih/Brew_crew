import 'dart:math';

import 'package:fireShouldSuceess/server/authinticate.dart';
import 'package:fireShouldSuceess/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  bool load = false;
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Register machaa'),
              backgroundColor: Colors.brown[500],
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => widget.toggleView(),
                    icon: Icon(Icons.ac_unit),
                    label: Text('SignIn'))
              ],
            ),
            body: Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: 'email'),
                        validator: (value) =>
                            value.isEmpty ? 'Enter a valid' : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) =>
                            value.length < 6 ? 'Enter a valid password' : null,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      FlatButton(
                        child: Text('Register'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              load = false;
                            });
                            final result =
                                await _auth.registerNewUser(email, password);
                            if (result == null) {
                            } else {
                              setState(() {
                                error = 'Error happnd try again later';
                                load = false;
                              });
                            }
                          } else {
                            return;
                          }
                        },
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.redAccent),
                      )
                    ],
                  ),
                )),
          );
  }
}
