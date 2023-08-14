import 'package:flutter/material.dart';

import 'App_Icons.dart';

class IconIosPage extends StatelessWidget {
  const IconIosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
         backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 0,
                  height: 1,
                  child:const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    App_Icons(icon: Icons.arrow_back_ios,),
                 
                  ],
                )
                )),
          ]
      ),
    ));
  }
}