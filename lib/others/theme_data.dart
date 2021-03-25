import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.pink,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.orange, //AppBar Background Color
      foregroundColor: Colors.blue,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    errorColor: Colors.red,
  );

  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.orange,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    errorColor: Colors.redAccent,
  );
}
