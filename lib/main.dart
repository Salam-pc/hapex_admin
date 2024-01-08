import 'package:hapex_admin/core/constants.dart';
import 'package:hapex_admin/core/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:hapex_admin/presentation/splash_screen/animated_splash_screen.dart';

void main() {
  LocalDatabase().dataBaseInitialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: kFNormal,
      ),
      home: const SplashScreen(),
    );
  }
}
