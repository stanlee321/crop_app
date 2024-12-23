import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'qr_result_screen.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner 📷'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => QRResultScreen(qrResult: result.text),
            ),
          );
        },
      ),
    );
  }
} 
