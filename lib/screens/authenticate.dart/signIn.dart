import 'package:fireShouldSuceess/server/authinticate.dart';
import 'package:fireShouldSuceess/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool load = false;
  String email = '';
  String password = '';
  String error = '';
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Sign in macha'),
              backgroundColor: Colors.brown[500],
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => widget.toggleView(),
                    icon: Icon(Icons.ac_unit),
                    label: Text('Register'))
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
                        validator: (v) =>
                            v.isEmpty ? 'enter a valid email' : null,
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
                        child: Text('Sign in'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              load = true;
                            });
                            final result =
                                await _auth.singnInUser(email, password);
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
                      )
                    ],
                  ),
                )),
          );
  }
}
