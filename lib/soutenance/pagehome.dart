
import 'package:ecommerce/widgets/bigtest.dart';
import 'package:flutter/material.dart';
import '../home/utils/essaye.dart';


class pagehome extends StatelessWidget {
  const pagehome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Scaffold(
        
        body: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 785,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/fin.jpeg"),
                    
                  )),
                   
                )),
            Positioned(
              bottom: 270,
                left: 30,
                right: 0,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: double.maxFinite,
                  height: 785,
                      child:Row(
                        
                        children: [
                          const Icon(Icons.lock,
                              color: Colors.white, size: 30),
                
                               Bigtext(
                                  text: "Zee Transfer", color: Colors.white,size: 30,),
                                  
                        ],
                      ) ,
                    ),
                ),
              Positioned(
                top: 40,
                left: 75,
                child:    GestureDetector(
                                        onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(
          builder: (context)=> const Homepage(),
          ));
      },
                  child: Container(
                  padding: const EdgeInsets.only(top: 400),
                           child: Container(
                            height: 50,
                            width: 200,
                             decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(colors: [
                              Color(0xfffd746c),
                              Color(0xffff9068),
                              Color(0xfffd746c)
                            ])),
                
                            child: const Center(
                            child: 
                  Text("Get Stated",
                  style: TextStyle(color: Colors.white, fontSize: 20))),
                           ),
                              ),
                ),),
            Positioned(
              top: 600,
                left: 40,
                right: 0,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: double.maxFinite,
                  height: 785,
                      child:Bigtext(
                         text: "Transfer Is Safe", color: Colors.white,size: 43) ,
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
