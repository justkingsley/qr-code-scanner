import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
        centerTitle: true,
        backgroundColor: const Color(0xFFD82B40),
      ),

      body: Container(
        color: const Color(0xFFF2E9BE),
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: NetworkImage('https://cdn.dribbble.com/users/1398774/screenshots/3184110/media/2a3819bf3f6e07ddd130d46f7e5fe7dd.gif')),
            flatButton("Scan QR Code", widget),
            SizedBox(height: 10.0,),
            flatButton("Generate QR Code", widget)
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFE6A0B8), width: 2.0),  //#E6A0B8
          borderRadius: BorderRadius.circular(20.0)),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF550A0F),fontWeight: FontWeight.bold),
      ), //#550A0F
    );
  }

}
