// ignore: file_names

import 'package:ecommerce/home/utils/EditAccount.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _TextfieldTestState();
}

class _TextfieldTestState extends State<SignUpPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 0,
        title: const Text('Sign In Here'),
        backgroundColor: Colors.blueGrey[900]!,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(" Hello Again !",
                style: TextStyle(
                    fontSize: 35,
                   
                    fontWeight: FontWeight.bold)),
         
            const SizedBox(
              height: 30,
            ), /////////////////////////////////////////
            textItem("Phone Number..", _emailcontroller, false, Icons.phone),
            const SizedBox(
              height: 15,
            ),
            // textIte(
            //   "Phone..",
              
            //   Icons.phone,
            // ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("                                ",
                    style: TextStyle( fontSize: 18)),
                Text("",
                    style: TextStyle( fontSize: 18)),
              ],
            ),

            const SizedBox(
              height: 30,
            ),
            colorbutton(),
            const SizedBox(
              height: 15,
            ),
            /////////:////////////////////////////////////
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const EditAccount()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("",
                      style: TextStyle( fontSize: 18)),

                  GestureDetector(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const EditAccount()),
                            );
                      },
                      child: const Text("",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),

                  // ignore: unnecessary_const
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                  ),
                  const Text("Or Continue With",
                      style: TextStyle( fontSize: 17)),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonItem("images/google.png", 25),
                const SizedBox(
                  height: 15,
                ),
                
                ButtonItem("images/phone.png", 30,

                ),
                const SizedBox(
                  height: 15,
                ),
                ButtonItem("images/facebook.png", 30),
                const SizedBox(
                  height: 15,
                ),
                ButtonItem("images/app.png", 30),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // ignore: sized_box_for_whitespace
          ],
        ),
      ),
    );
  }

  Widget colorbutton() {
    return InkWell(
      onTap: () async {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           color: Colors.blueGrey[800]!),
            // gradient: const LinearGradient(colors: [
            //   Color(0xfffd746c),
            //   Color(0xffff9068),
            //   Color(0xfffd746c)
            // ])),
        child: Center(
            child: circular
                ? const CircularProgressIndicator()
                : const Text("Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    );
  }
Widget textIte(
      String labelText,IconData imagepath ) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width - 70,
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(fontSize: 17, ),
        decoration: InputDecoration(
          labelText: labelText,
    
          labelStyle: const TextStyle(fontSize: 17, ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1.5, color: Colors.amber)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.grey)),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget ButtonItem(String imagepath, double size) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 60,
      width: 85,
      child: Card(
     
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 12,
              ),
              child: Image.asset(
                imagepath,
                height: size,
                width: 50,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text("", style: TextStyle(fontSize: 17,)),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  bool isclikable = false;
  bool confirmationcode = true;
  Widget textItem(String labelText, TextEditingController controller,
      bool obscureText, IconData imagepath) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width - 70,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
         keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(fontSize: 17, color: Colors.white),
        decoration: InputDecoration(
          labelText: isclikable  ? labelText : "",
          labelStyle: const TextStyle(fontSize: 17,),
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                isclikable = !isclikable;
              });
            },
            icon: isclikable
                ? Icon(
                    imagepath,
                  
                  )
                :const Icon(
                    Icons.phone,
                    
                  ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1.5, color: Colors.amber)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, )),
        ),
      ),
    );
  }
}
