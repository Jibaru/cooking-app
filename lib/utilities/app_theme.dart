import 'package:flutter/material.dart';

class AppTheme {
  static AppBarTheme appBarTheme(BuildContext context) {
    return AppBarTheme.of(context).copyWith(
      color: Colors.white,
      iconTheme: IconThemeData.fallback(),
      brightness: Brightness.dark,
      shadowColor: Colors.black87,
      elevation: 5.0,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Colors.black, fontSize: 18, fontFamily: 'ReemKufi'),
      ),
    );
  }

  static FloatingActionButtonThemeData floatingActionButtonTheme(
      BuildContext context) {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black45,
    );
  }
}
