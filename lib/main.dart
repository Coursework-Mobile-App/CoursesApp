import 'package:courses_app/dependencies.dart';
import 'package:courses_app/navigator_panel/navigator.dart';
import 'package:courses_app/network/user_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'navigator_panel/main_panel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var x = UserNetwork();
  x.getUserFromDb("1");
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
