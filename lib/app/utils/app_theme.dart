import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get lightTheme {
    return ThemeData.light(useMaterial3: true);
  }

  ThemeData get darkTheme {
    return ThemeData.dark(useMaterial3: true);
  }
}
