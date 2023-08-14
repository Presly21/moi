import 'package:flutter/material.dart';
ThemeData lighttheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor:Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  brightness: Brightness.light,
  iconTheme: IconThemeData(color: Colors.black),
  textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.black),
  colorScheme: ColorScheme.light(
    background: Colors.grey[300]!,
    primary: Colors.grey[200]!,
    secondary: Colors.grey[300]!,
    
  )
);