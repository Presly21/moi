  
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
      ),
      home: const Scann(),
    );
  }
}

class Scann extends StatefulWidget {
  const Scann({Key? key}) : super(key: key);

  @override
  State<Scann> createState() => _ScannState();
}

class _ScannState extends State<Scann> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan here'),
        backgroundColor: Colors.blueGrey[900]!,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              }, 
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text("Start Scan"),
               ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}