
import 'package:flutter/material.dart';
import 'contents_model.dart';
import 'essaye.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentindex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: currentindex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentindex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  ),
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              contents.length, (index) => builDot(index, context)),
        ),
        GestureDetector(
          onTap: () {
            if (currentindex == contents.length - 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Homepage()));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey[800]!,
            ),
            height: 60,
            margin: const EdgeInsets.all(40),
            width: double.infinity,
            child: Center(
                child: Text(
              currentindex == contents.length - 1 ? "Continue" : "Next",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        )
      ],
    ));
  }

  Container builDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentindex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey[800]!),
    );
  }
}
