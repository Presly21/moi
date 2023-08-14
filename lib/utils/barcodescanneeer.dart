
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Barcode extends StatefulWidget {
  const Barcode({super.key});
  String get title => "Barcode";

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String _scanBarcodeResult = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton(
                    onPressed: scanBarcodeNormal,
                    child: const Text("Start Barcode Scan")),
                ElevatedButton(onPressed: scnQR, child:const Text("Start QR Code")),
                ElevatedButton(
                    onPressed: startBarcodeStream,
                    child:const Text("Start barcode scan stream")),
                Text("Barcode Result $_scanBarcodeResult")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "ff6666", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = "Failled to get plaform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void scnQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "ff6666", "cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = "Failled to get plaform version";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }

  void startBarcodeStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      "#ff666",
      "cancel",
      true,
      ScanMode.BARCODE,
    )!
        .listen((barcode) {});
  }
}
