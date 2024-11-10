import 'package:flutter/material.dart';
import 'package:weather_now/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
