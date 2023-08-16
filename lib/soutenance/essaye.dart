
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:monprojet/soutenance/settingpage.dart';
import 'package:monprojet/soutenance/widgets/small_text.dart';
import '../../soutenance/Scancode.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  final List<String> images = [
    'https://th.bing.com/th/id/R.43b8670a6952a61dfb4bab1f24752390?rik=QotilxGJbZoM9w&pid=ImgRaw&r=0',
    'https://www.entreprises-magazine.com/wp-content/uploads/2018/09/Orange-Tunisie.png',
  ];
   Color _borderColor =Colors.blueGrey[800]!;
   
  void _changeBorderColor() {
    setState(() {
      if (_borderColor ==  Colors.blueGrey[800]!) {
        _borderColor = Theme.of(context).colorScheme.primary;
      } else {
        _borderColor =Colors.amber;
      }
    });
  }
  

  PageController pageController = PageController(viewportFraction: 0.85);
  // ignore: unused_field
  var _currPagevalue = 0.0;
  // ignore: prefer_final_fields
  double _scaleFactor = 0.8;
  // ignore: prefer_final_fields
  double _height = 220;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -0.2),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.repeat(reverse: true);
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagevalue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/hoe.png"),
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              Column(
                                children: [
                                  Smalltext(
                                    text: "Good Evening.",
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                 Text("Presly Ebonke",
                                    style: TextStyle(fontWeight: FontWeight.bold,),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.notifications,
                              size: 40,
                              
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 11,
                              width: 11,
                              margin: const EdgeInsets.only(
                                  left: 25, right: 3, top: 7),
                              child: Column(
                                children: [
                                  Container(
                                    //  padding: EdgeInsets.only(top: 3,left: 110),

                                    height: 11,
                                    width: 11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 150,
              left: 10,
              child:  Text("Services",
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
                                    ),),
          Positioned(
            top: 180,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(padding:EdgeInsets.only(top: 20)),
                  GestureDetector(
                    onTap: _changeBorderColor,
                    child: Container(
                      height: 100,
                      width: 70,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: _borderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[900],
                      ),
                      child: GestureDetector(
                           onTap: (
                      
                     
                    ) {
                      Navigator.push( 
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Scann(),
                          ));
                    },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: const Icon(
                                  Icons.qr_code_scanner,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              Column(
                                children: [
                                  Smalltext(
                                    text: "Scan &",
                                    color: Colors.grey,
                                    size: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Smalltext(
                                    text: "Pay",
                                    color: Colors.grey,
                                    size: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _changeBorderColor,
                    child: Container(
                      height: 100,
                      width: 70,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                         border: Border.all(color: _borderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[900],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: const Icon(
                                Icons.rocket_launch_outlined,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                Smalltext(
                                  text: "Send",
                                  color: Colors.grey,
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Smalltext(
                                  text: "Money",
                                  color: Colors.grey,
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _changeBorderColor,
                    child: Container(
                      height: 100,
                      width: 70,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                         border: Border.all(color: _borderColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[900],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Transform.rotate(
                                angle: 53.0,
                                child: const Icon(
                                  Icons.rocket_launch_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Smalltext(
                                  text: "Receive",
                                  color: Colors.grey,
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Smalltext(
                                  text: "Money",
                                  color: Colors.grey,
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //////

                  GestureDetector(
                    onTap: (
                      
                     
                    ) {
                     
                      Navigator.push( 
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settingpage(),
                          ));
                    },
                    child: Container(
                      height: 100,
                      width: 70,
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                     
                      decoration: BoxDecoration(
                         border: Border.all(color: _borderColor, width: 1.0),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey[900],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: const Icon(
                                Icons.settings,
                                size: 40,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              children: [
                                Smalltext(
                                  text: "Setting",
                                  color: Colors.grey,
                                  size: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                Smalltext(
                                  text: "",
                                  color: Colors.grey,
                                  size: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ////////////////////////////////////////////////////
          Positioned(
            top: 320,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(40),
                ),
                color: Colors.blueGrey[900],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 300,
                      child: PageView.builder(
                          itemCount: 2,
                          itemBuilder: (context, position) {
                            return _buildPageItem(position);
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 78),
                      child: Smalltext(
                        text: "Resent Transactions ",
                        color: Colors.blueGrey[800],
                        size: 28,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 21),
                                    margin: const EdgeInsets.only(
                                      top: 1,
                                    ),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/hoe.png"),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 10)),
                                  Column(
                                    children: [
                                      Smalltext(
                                        text: "Prime Remembership",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Smalltext(
                                        text: "15 April-11:02",
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  // ignore: sort_child_properties_last
                                  child: Smalltext(
                                    text: "\$10000",
                                    color: Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int index) {
    // ignore: unused_local_variable
    Matrix4 matrix = Matrix4.identity();
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: 290,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  enableInfiniteScroll: false,
                ),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(images[index]),
                            fit: BoxFit.cover,
                          )),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
