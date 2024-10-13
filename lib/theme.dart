import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    fontFamily: 'Ubuntu',
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Ubuntu',
  );
}
