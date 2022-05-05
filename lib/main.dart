import 'package:courses_app/dependencies.dart';
import 'package:courses_app/navigator_panel/navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'navigator_panel/main_panel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
