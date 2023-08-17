import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle boldtextStyle(double fontSize, [Color? color]) => TextStyle(
      color: color ?? colorBlack,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );

TextStyle semiboldtextStyle(double fontSize, [Color? color]) => TextStyle(
      color: color ?? colorBlack,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );

TextStyle mediumtextStyle(double fontSize, [Color? color]) => TextStyle(
      color: color ?? colorBlack,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );

TextStyle regulartextStyle(double fontSize, [Color? color]) => TextStyle(
      color: color ?? colorBlack,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );

TextStyle thintextStyle(double fontSize, [Color? color]) => TextStyle(
      color: color ?? colorBlack,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
