import 'package:courses_app/dependencies.dart';
import 'package:courses_app/navigator_panel/navigator.dart';
import 'package:flutter/material.dart';
import 'navigator_panel/main_panel.dart';

void main() async {
  await Dependencies.init();
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
    home: MainScreen(
      key: AppNavigator.bottomBarKey,
    ),
    navigatorKey: AppNavigator.navigatorKey,
  ));
}
