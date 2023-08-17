import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monprojet/soutenance/phoneAuthPage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'essaye.dart';

class PhoneAuthentification extends StatefulWidget {
  const PhoneAuthentification({super.key});
  @override
  State<PhoneAuthentification> createState() => _PhoneAuthentificationState();
}

class _PhoneAuthentificationState extends State<PhoneAuthentification> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Widget Otp_field() {
    return OTPTextField(
      length: 6,
      onChanged: (value) {
        code = value;
      },
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 38,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.blueGrey[800]!,
        borderColor: Colors.blueGrey[800]!,
      ),
      style: const TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  int start = 30;
  bool wait = false;
  void Starttimer() {
    const onsec = Duration(seconds: 1);
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  var code = "";
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
        child: SingleChildScrollView(
          child: Column(
            children: [
               const SizedBox(
                height: 100,
              ),
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
              height: 10,
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
            
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Text(
                      "Enter 4 Digit OTP",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Otp_field(),
              const SizedBox(
                height: 40,
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
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: PhoneAuthPage.verify,
                                smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Homepage(),
                                ));
                      } catch (e) {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Otp")));
                      }
                    },
                    child: Text("Verifier le numero de telephone"),
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
