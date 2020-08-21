import 'package:fireShouldSuceess/model/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile(this.brew);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.brown[brew.strength],
      ),
      title: Text(brew.name),
      subtitle: Text('sugers ${brew.suger}'),
    );
  }
}
