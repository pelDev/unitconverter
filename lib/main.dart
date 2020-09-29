import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitconverter/screens/home.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Hexcolor("#795548"),
          primaryColorDark: Hexcolor("#5D4037"),
          primaryColorLight: Hexcolor("#D7CCC8"),
          accentColor: Hexcolor("#FF5722")),
      home: UnitConverterHome(),
    );
  }
}
