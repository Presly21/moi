import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  int start = 30;
  bool wait = false;
  String buttonname = "Send";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirmation Code..",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              textfield(),
              const SizedBox(
                height: 30,
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
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Sent OTP again in ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.yellow),
                  ),
                  TextSpan(
                    text: "00:$start ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.pinkAccent),
                  ),
                  const TextSpan(
                    text: "sec: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.yellow),
                  ),
                ],
              )),
              const SizedBox(height: 150,),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 60,
                decoration:  BoxDecoration(
                  color: Colors.blueGrey[800]!,
                  borderRadius: BorderRadius.circular(15),
                  
                ),
                child: const Center(
                  child: Text("Log In", style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
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

  Widget Otp_field() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
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

  Widget textfield() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]!,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 17, color: Colors.white),
         keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone number",
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),
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
                : () {
                    Starttimer();
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonname = "Resend";
                    });
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(buttonname,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: wait?Colors.grey:Colors.green,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
