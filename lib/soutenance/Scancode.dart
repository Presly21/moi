// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_Scanner/flutter_barcode_Scanner.dart';

// class Barcoded extends StatefulWidget {
//   const Barcoded({super.key});

//   @override
//   State<Barcoded> createState() => _BarcodedState();
// }

// class _BarcodedState extends State<Barcoded> {
//   String? scanResult;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan here'),
//         backgroundColor: Colors.blueGrey[900]!,
//         elevation: 0,
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 120),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blueGrey[800]!,
                
//               ),
//               icon: const Icon(Icons.camera_alt_outlined),
//               label: const Text("Start Scan"),
//               onPressed: scancode,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               scanResult == null ? 'Scan a Code!' : 'Scan result! :$scanResult',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//     // ignore: dead_code
//   }

//   Future scancode() async {
//     // ignore: unused_local_variable
//     String scanResult;
//     try {
//       scanResult = await FlutterBarcodeScanner.scanBarcode(
//           "ff6666", "cancel", true, ScanMode.BARCODE);
//     }catch(e){
//      print(e);
//     }
//       // scanResult = 'Failled to get plaform result.';
//     }
//     // if (!mounted) return;
//     // setState(() => this.scanResult = scanResult);
//   }

  
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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