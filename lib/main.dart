import 'package:courses_app/dependencies.dart';
import 'package:courses_app/navigator_panel/navigator.dart';
import 'package:flutter/material.dart';
import 'navigator_panel/main_panel.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() async {
  await Dependencies.init();
  runApp(BackGestureWidthTheme(
      backGestureWidth: BackGestureWidth.fraction(1 / 2),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS:
                  CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
            })),
        home: MainScreen(
          key: AppNavigator.bottomBarKey,
        ),
        navigatorKey: AppNavigator.navigatorKey,
      )));
}
