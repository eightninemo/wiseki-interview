import 'package:flutter/material.dart';
import 'package:wisekinoteapp/utils/constants/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: colorWhite,
      iconTheme: const IconThemeData(
        color: colorBlack,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: colorBlack,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
