import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class perfect extends StatefulWidget {
  perfect({super.key});

  @override
  State<perfect> createState() => _perfectState();
}

class _perfectState extends State<perfect> {
  final List<String> images =
   ['images/MTN.png', 'images/orange.png'];

  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        CarouselSlider(
          
          options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        disableCenter: true,
          ),
          items: images.map((image) => Container(
          width: 400,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
        )).toList(),
        ),
      ],
    );
  }
}
