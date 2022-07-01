// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_news/themes/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'NotoSansThai',
    primaryColor: primary,
    colorScheme: ColorScheme.light(primary: primary),
    scaffoldBackgroundColor: icons,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
      titleTextStyle: TextStyle(
        fontSize: 16.0, 
        fontWeight: FontWeight.w700,
        color: icons
      )
    )
  );
}