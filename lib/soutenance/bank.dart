// ignore_for_file: avoid_unnecessary_containers
import 'package:ecommerce/widgets/small_text.dart';
import 'package:flutter/material.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
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
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Container(
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 45, bottom: 15),
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
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
                                        Smalltext(
                                          text: "Presly Ebonke",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),

                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                    child: const Icon(
                                      Icons.notifications,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 11,
                                      width: 11,
                                      margin: const EdgeInsets.only(
                                          left: 25, right: 3, top: 13),
                                      child: Column(
                                        children: [
                                          Container(
                                            //  padding: EdgeInsets.only(top: 3,left: 110),

                                            height: 11,
                                            width: 11,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //                    padding: EdgeInsets.only(top: 3,left: 110),
                            //                               child: Container(
                            //                   height: 8,
                            //                   width: 8,
                            //         decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(50),color: Colors.red,
                            //   ),
                            //                 ) ,
                            //                             ) ,
                            // Column(
                            //   children: [
                            //           Column(
                            //             children: [

                            //                 // ignore: sort_child_properties_last
                            //               //  const Icon(Icons.notifications,
                            //               //       color: Colors.white, size: 44),
                            //               //  ButtonTheme(child: Icon(Icons.circle,color: Colors.red,size: 8,)),

                            //          Column(
                            //           children: [
                            //             Positioned(
                            //               child: Column(

                            //                 children: [
                            //                   Container(

                            //                                    child:   Icon(Icons.notifications,
                            //                           color: Colors.white, size: 44),

                            //                                           ),

                            //                 ],
                            //               ),
                            //             ),
                            //   //           Column(
                            //   //             children: [
                            //   //               Container(
                            //   //                 height: 8,
                            //   //                 width: 8,
                            //   //       decoration: BoxDecoration(
                            //   //   borderRadius: BorderRadius.circular(50),color: Colors.red,
                            //   // ),
                            //   //               ),
                            //   //             ],
                            //   //                                             ),

                            //           ],
                            //         ),
                            //   // padding: EdgeInsets.only( top: 10 ),

                            //             ],
                            //           ),

                            //         ],

                            // ),
                          ],
                        ),
                      ),

                      //////
                      ///

                      Align(
                        child: Container(
                          margin: const EdgeInsets.only(right: 160, top: 15),
                          child: Smalltext(
                            text: "Services ",
                            color: Colors.white,
                            size: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /////
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Padding(padding:EdgeInsets.only(top: 20)),
                            Container(
                              height: 90,
                              width: 70,
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 25),
                                      child: const Icon(
                                        Icons.qr_code_scanner,
                                        size: 40,
                                        color: Colors.pink,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Smalltext(
                                          text: "Scan &",
                                          color: Colors.pink,
                                          size: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Smalltext(
                                          text: "Pay",
                                          color: Colors.pink,
                                          size: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 90,
                              width: 70,
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey,
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 25),
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
                                          size: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Smalltext(
                                          text: "Money",
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
                            //////

                            Container(
                              height: 90,
                              width: 70,
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueGrey,
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 25),
                                      child: const Icon(
                                        Icons.rocket,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Smalltext(
                                          text: "Receive",
                                          color: Colors.grey,
                                          size: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Smalltext(
                                          text: "Money",
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
                          ],
                        ),
                      ),
                      //////
                    ],
                  )),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: Positioned(
                  height: MediaQuery.of(context).size.height * 06,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: 40),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            topLeft: Radius.circular(40),
                          ),
                          color: Colors.blueGrey,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Positioned(
                                // ignore: sized_box_for_whitespace
                                child: Container(
                                  height: 300,
                                  child: PageView.builder(
                                      controller: pageController,
                                      itemCount: 2,
                                      itemBuilder: (context, position) {
                                        return _buildPageItem(position);
                                        // ignore: dead_code
                                        return _buildItem(position);
                                        // ignore: dead_code
                                      }),
                                ),
                              ),
                              Container(
                                child: Smalltext(
                                  text: "Resent Transactions ",
                                  color: Colors.grey,
                                  size: 28,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white,
                                                  image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "images/hoe.png"),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10)),
                                              Column(
                                                children: [
                                                  Smalltext(
                                                    text: "Prime Remembership",
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Smalltext(
                                                    text: "15 April-11:02",
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Container(
                                  // height: 100,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 21),
                                                  margin: const EdgeInsets.only(
                                                    top: 1,
                                                  ),
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                    image:
                                                        const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          "images/hoe.png"),
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10)),
                                                Column(
                                                  children: [
                                                    Smalltext(
                                                      text:
                                                          "Prime Remembership",
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Smalltext(
                                                      text: "15 April-11:02",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                ),
                              ),
                              Container(
                                child: Container(
                                  // height: 100,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 21),
                                                  margin: const EdgeInsets.only(
                                                    top: 1,
                                                  ),
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                    image:
                                                        const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          "images/hoe.png"),
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10)),
                                                Column(
                                                  children: [
                                                    Smalltext(
                                                      text:
                                                          "Prime Remembership",
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Smalltext(
                                                      text: "15 April-11:02",
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
            margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/MTN.png")),
            ),
          ),
          //child container
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
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
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/orange.png")),
            ),
          ),
          //child container
        ],
      ),
    );
  }
}
