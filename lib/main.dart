import 'package:flutter/material.dart';
import 'landing_page/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // theme
  final ThemeData _themeData = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.green,
    ),
    fontFamily: 'Roboto',
    textTheme: TextTheme(
        displayLarge: TextStyle(
        fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800],
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
    ),
    ),
     elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         backgroundColor: Colors.blue,
         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
         textStyle: TextStyle(fontSize: 18),
       ),
     ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickFlick',
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: LandingPage(),
    );
  }
}
