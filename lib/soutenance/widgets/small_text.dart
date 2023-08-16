// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Smalltext extends StatelessWidget {
  final Color? color;
  String text;
  double size;
  double height;
  Smalltext({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
    this.height=1.2, required FontWeight fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          color: color,
          height: height,
          fontWeight: FontWeight.w400),
    );
  }
}
