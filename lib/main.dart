import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.amber,
    ),
    color: Colors.black,
    home: MainScreen(),
  ));
}
