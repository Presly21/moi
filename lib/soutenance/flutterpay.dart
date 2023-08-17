import 'package:flutter/material.dart';

class Flutterpay extends StatefulWidget {
  const Flutterpay({super.key});

  @override
  State<Flutterpay> createState() => _FlutterpayState();
}
class _FlutterpayState extends State<Flutterpay> {
  TextEditingController _email = TextEditingController();
  TextEditingController _amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Money"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Stack(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: _amount,
                  decoration: const InputDecoration(labelText: "Amount"),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                // ignore: unused_local_variable
                final email = _email.text;
                // ignore: unused_local_variable
                final amount = _amount.text;
                if (email.isEmpty || amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Field are empty")));
                }else{

                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlue,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.payment),
                    Text(
                      "Make payment",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
}
