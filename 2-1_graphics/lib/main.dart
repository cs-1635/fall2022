import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS 1635 Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CS 1635'),
      ),
      body: ListView(children: <Widget>[
        Container(
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: OpenPainter(),
          ),
        ),
      ]),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(200, 200), 100, paint1);

    var paint2 = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 20;
    //canvas.drawLine(Offset(0,0), Offset(200,200), paint2);
    canvas.drawCircle(Offset(200, 200), 80, paint2);

    canvas.drawCircle(Offset(200, 200), 60, paint1);
    canvas.drawCircle(Offset(200, 200), 40, paint2);
    canvas.drawCircle(Offset(200, 200), 20, paint1);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}