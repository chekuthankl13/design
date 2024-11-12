import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: "Poppins",
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white, surfaceTintColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
  );
}
