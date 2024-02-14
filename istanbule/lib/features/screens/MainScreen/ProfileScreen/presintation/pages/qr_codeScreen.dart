import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:istanbule/features/screens/widgets/mainButton.dart';
import 'package:istanbule/features/screens/widgets/main_Appbar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerApp extends StatefulWidget {
  @override
  _QRCodeScannerAppState createState() => _QRCodeScannerAppState();
}

class _QRCodeScannerAppState extends State<QRCodeScannerApp> {
  late QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleAppBar: 'QR Code Scanner'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,

                  color: Colors.grey, // Container background color
                  child: Image.asset(
                    'assets/images/qr.png',
                    fit: BoxFit.cover, // Adjust the BoxFit as needed
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
