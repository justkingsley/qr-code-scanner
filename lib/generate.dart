import 'package:flutter/material.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }
}
