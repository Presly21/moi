
import 'package:flutter/material.dart';
import 'package:monprojet/soutenance/settingpage.dart';
class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _TextfieldTestState();
}

class _TextfieldTestState extends State<EditAccount> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
        backgroundColor: Colors.blueGrey[900]!,
      ),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Edit Account",
                  style: TextStyle(
                      fontSize: 35,
                     
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              textItem("Complete Name..", _namecontroller, false),
              const SizedBox(
                height: 15,
              ),
              textItem("Password..", _emailcontroller, true),
              const SizedBox(
                height: 15,
              ),
              textIte("Phone Number.."),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              colorbutton(),
              const SizedBox(
                height: 13,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("                                            ",
                      style: TextStyle( fontSize: 18)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
              // ignore: sized_box_for_whitespace
            ],
          ),
        ),
      ),
    );
  }

  Widget colorbutton() {
    return GestureDetector(
       onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settingpage(),
                      ));
                },
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
                : const Text("Save and Live",
                    style: TextStyle( fontSize: 20))),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ButtonItem(String imagepath, String buttonname, double size) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 60,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagepath,
              height: size,
              width: size,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(buttonname,
                style: const TextStyle(fontSize: 17, color: Colors.white)),
          ],
        ),
      ),
    );
  }
Widget textIte(
      String labelText, ) {
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
  Widget textItem(
      String labelText, TextEditingController controller, bool obscureText) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width - 70,
      child: TextFormField(
        
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 17),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 17),
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
}
