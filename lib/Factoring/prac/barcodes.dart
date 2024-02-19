import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  TextEditingController barcodeController = TextEditingController();
  String barcodeResult = "Scan a barcode";

  Future<void> scanBarcode() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Color for the toolbar
        "Cancel", // Text for the cancel button
        true, // Show flash icon
        ScanMode.BARCODE, // Specify the scan mode
      );
    } on PlatformException {
      result = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      barcodeResult = result ?? "Scan failed!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Barcode Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: barcodeController,
              decoration: InputDecoration(
                labelText: 'Enter Barcode',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  barcodeResult = barcodeController.text;
                });
              },
              child: Text("Submit Barcode"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => scanBarcode(),
              child: Text("Scan Barcode"),
            ),
            SizedBox(height: 20),
            Text(
              barcodeResult,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
