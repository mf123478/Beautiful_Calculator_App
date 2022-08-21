import 'package:calculator_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ThemeClass{

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff22252D),
    colorScheme: const ColorScheme.dark(),
  );

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff22252D),
    colorScheme: const ColorScheme.light(),
  );
}
