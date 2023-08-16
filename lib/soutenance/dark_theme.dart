import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor:Colors.blueGrey[800]!,
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.blueGrey[900]!,
    secondary: Colors.grey[100]!,
    tertiary: Colors.grey[800]!,
    
  )
);
