import 'package:fireShouldSuceess/model/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './brew_tile.dart';

class BrewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brew>>(context);
    brew.forEach((element) {
      print(element.name);
      print(element.suger);
      print(element.strength);
    });
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return BrewTile(brew[index]);
        },
        itemCount: brew.length,
      ),
    );
  }
}
