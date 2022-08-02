import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  String qrResult = "Not yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
        backgroundColor: const Color(0xFFD82B40),
      ),
      body: Container(
        color: const Color(0xFFF2E9BE),
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            const Text("Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            // Text(qrResult,
            //   style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 40.0,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: qrResult,
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL;
                      }
                  )
                ),
              ),
              const SizedBox(height: 40.0,),
              ElevatedButton(onPressed: () async {
                final scanning = (await BarcodeScanner.scan());
                setState((){
                  qrResult = scanning.rawContent.toString();
                });
                print(qrResult);
              },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFE6A0B8),
                    onPrimary: const Color(0xFF550A0F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))
                ), child: const Text(
                "Scan QR Code",
              ),
              )
          ],
        ),
      ),
    );
  }
  Uri _url = 'https://pub.dev/packages/http' as Uri;
  void _launchURL() async =>
      await canLaunchUrl(_url) ? await launchUrl(_url) : throw 'Could not launch $_url';
}
