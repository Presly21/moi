import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';


class ICONANDTEXTWIDGET extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const ICONANDTEXTWIDGET({super.key,
   required this.icon, 
   required this.text, 
    required this.iconColor
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
Icon(icon,color:iconColor,),
const SizedBox(width: 5,),
Smalltext(text: text,  fontWeight: FontWeight.bold,),
      ],
    );
  }
}
