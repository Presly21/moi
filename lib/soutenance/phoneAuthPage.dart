
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});
  static String verify = "";
  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";
  @override
  void initState() {
    countrycode.text = "+237";
    // TODO: implement initState
    super.initState();
  }

  int start = 30;
  bool wait = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Text(
          "Confirmation Code..",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
                              width: 100,
                              height: 120,
                              decoration: const BoxDecoration(
                                
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/auth2.jpg",),
                                ),
                              ),
                            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Phone verification",style: TextStyle(fontWeight: FontWeight.bold, ),),
              const SizedBox(
              height: 10,
            ),
            const Text("We need to register your phonr before getting",style: TextStyle( ),),
              const SizedBox(
              height: 10,
            ),
            const Text("started!",style: TextStyle( ),),
              const SizedBox(
              height: 10,
            ),
            textfield(),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
            ),
            const SizedBox(
              height: 20,
            ),
           
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // modifier la valeur pour ajuster le degré d'arrondi
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[800]!), // changer la couleur d'arrière-plan
  ),
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countrycode.text + phone}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneAuthPage.verify = verificationId;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneAuthentification(),
                              ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    },
                    child:  const Text("Envoyer le code",style: TextStyle(fontSize: 20,),)),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

  Widget textfield() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]!,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          phone = value;
        },
        style: const TextStyle(fontSize: 17, color: Colors.white),
        // keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone number",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text("(+237)",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {},
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            ),
          ),
        ),
      ),
    );
  }
}
