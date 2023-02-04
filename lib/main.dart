import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.redAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
