import 'dart:math';

import 'package:flutter/material.dart';

class OWidget extends StatelessWidget {
  const OWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: CustomPaint(
            painter: Cross(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class Cross extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        min(size.width / 2, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
