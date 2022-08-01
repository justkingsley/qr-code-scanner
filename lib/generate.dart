import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {

  String qrData = 'https://github.com/justkingsley';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate'),
        centerTitle: true,
        backgroundColor: const Color(0xFFD82B40),
      ),
      body: Container(
        color: const Color(0xFFF2E9BE),
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            QrImage(data: qrData),
            const SizedBox(height: 10.0,),
            Text('Get your data/link to the QR Code'),
            TextField(
              controller: qrText,
              decoration: InputDecoration(
                hintText: 'Enter the Data/Link',
              ),
            ),

            ElevatedButton(onPressed: () async {

              if(qrText.text.isEmpty){
                setState(() {
                  qrData = 'https://flutter.dev';
                });
              }else{
                  setState(() {
                    qrData = qrText.text;
                  });
              }
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
  final qrText = TextEditingController();
}
