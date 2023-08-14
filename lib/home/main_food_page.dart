import 'package:ecommerce/home/food_page_body.dart';
import 'package:ecommerce/widgets/bigtest.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body:  Column(
      children: [
         Container(
        margin:  const EdgeInsets.only(top: 45,bottom: 15),
        padding:const EdgeInsets.only(left:20,right: 20) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Column(
              children: [
              Bigtext(text: "Cameroun",color: App_Colors.mainColor),
             Row(
              children: [
                 Smalltext(text: "Douala",color: Colors.black54,  fontWeight: FontWeight.bold,),
                 const Icon(Icons.arrow_drop_down_rounded)
              ],
             )
              ],
            ),
           Column(
            children: [
               Center(
                 child: Container(
                             width: 45,
                             height: 45,
                             // ignore: sort_child_properties_last
                             child:  const Icon(Icons.search,color: Colors.white,size:24),
                             decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF89dad0),
                             ),
                           ),
               )
            ],
           )
          ],
        ),
      ),
      const Expanded(child: SingleChildScrollView(
        child:  FoodPageBody(),
      ))
      ],
)
    );
  }
}

// ignore: camel_case_types
class App_Colors {
  static const Color mainColor = Color(0xFF89dad0);
}