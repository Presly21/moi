// ignore: file_names
import 'package:ecommerce/home/utils/dimensions.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Bigtext extends StatelessWidget {
  final Color? color;
  String text;
  double size;
  TextOverflow overflow;
   Bigtext({super.key,required this.text,this.color =const Color(0xFF332d2b),
   
   this.overflow =TextOverflow.ellipsis, //ici c'est pour que si le text est trop long ,ce la ce termine avec des points
   this.size=20,

   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size==0?Dimensions .font20:size,
        color: color,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
