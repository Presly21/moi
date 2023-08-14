import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home/utils/essaye.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://lottie.host/594b01aa-3cc7-42c2-ae97-c965dfbfb473/AafJAC68qF.json",
              controller: _controller, onLoaded: (compos) {
            _controller
              ..duration = compos.duration
              ..forward().then((value) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Homepage()));
              });
          }),
          const Center(
            child: Text("FinTech",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
