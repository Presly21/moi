// ignore_for_file: must_call_super, unnecessary_new

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/widgets/bigtest.dart';
import 'package:ecommerce/widgets/icons_and_text_widget.dart';
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'main_food_page.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  // ignore: unused_field
  var _currPagevalue = 0.0;
  // ignore: prefer_final_fields
  double _scaleFactor = 0.8;
  // ignore: prefer_final_fields
  double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagevalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPagevalue.floor(),
          decorator: DotsDecorator(
            activeColor: App_Colors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //popular text
        const SizedBox(
          height: 30,
        ),

        Container(
          margin: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bigtext(text: "Popular"),
              const SizedBox(width: 10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: Bigtext(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              const SizedBox(width: 7),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Smalltext(text: "Food Pairing",  fontWeight: FontWeight.bold,),
              ),
              //List of foods and images
              // ignore: sized_box_for_whitespace
            ],
          ),
        )
        //list of foods and images

        ,
        // ignore: sized_box_for_whitespace
        Container(
          height: 900,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            //shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 20, right: 20,bottom: 10),
                  child: Row(
                    children: [
                      //images section
                    Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage("images/b.jpg")),
                        ),
                      )
                    ,//text container
                    Expanded(
                      child: Container(
                      height: 100,
                                       
                       decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.white70,
                       ),
                       child: Padding(padding: 
                     const  EdgeInsets.only(left: 10,right: 10),child: 
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Bigtext(text: "Nutritious fruit meal in China"),
                          const SizedBox(height: 10,),
                          Smalltext(text: "With Chinese Characteristics",  fontWeight: FontWeight.bold,),
                         const SizedBox(height: 10,),
                          const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ICONANDTEXTWIDGET(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: (Colors.orange)),
                        ICONANDTEXTWIDGET(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: App_Colors.mainColor),
                        ICONANDTEXTWIDGET(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: (Colors.orangeAccent))
                      ],
                    )
                        ],
                      )
                       ),
                       
                      ),
                      
                      
                    )
                    
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    // ignore: unused_local_variable
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPagevalue.floor()) {
      // ignore: unused_local_variable
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      // ignore: unused_local_variable
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() + 1) {
      // ignore: unused_local_variable
      var currScale =
          _scaleFactor + (_currPagevalue - index + 1) * (1 - _scaleFactor);
      // ignore: unused_local_variable
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() - 1) {
      // ignore: unused_local_variable
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      // ignore: unused_local_variable
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9264cc),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/a.jpg")),
            ),
          ),
          //child container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 7.0,
                        offset: Offset(0, 7)),
                    BoxShadow(color: Colors.white, offset: Offset(-4, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(text: "Chinese Side"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(Icons.star,
                                    color: App_Colors.mainColor, size: 15))),
                        const SizedBox(
                          width: 10,
                        ),
                        Smalltext(text: "4.5",  fontWeight: FontWeight.bold,),
                        const SizedBox(
                          width: 10,
                        ),
                        Smalltext(text: "1287",  fontWeight: FontWeight.bold,),
                        const SizedBox(
                          width: 10,
                        ),
                        Smalltext(text: "Comments",  fontWeight: FontWeight.bold,),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ICONANDTEXTWIDGET(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: (Colors.orange)),
                        ICONANDTEXTWIDGET(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: App_Colors.mainColor),
                        ICONANDTEXTWIDGET(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: (Colors.orangeAccent))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
