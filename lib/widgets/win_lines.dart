import 'package:flutter/material.dart';

class WinLines extends CustomPainter {
  String? lineType;

  WinLines({this.lineType});

  @override
  void paint(Canvas canvas, Size size) {
    const double diagonal = 40;
    const double horizontal = 30;
    const double vertical = 30;

    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;

    if (lineType != null) {
      // for diagonal
      if (lineType == 'd0') {
        canvas.drawLine(const Offset(diagonal, diagonal),
            Offset(size.width - diagonal, size.height - diagonal - 20), paint);
      } else if (lineType == 'd1') {
        canvas.drawLine(Offset(size.width - diagonal, diagonal),
            Offset(diagonal, size.height - diagonal - 20), paint);
      } else if (lineType == 'h0') {
        canvas.drawLine(Offset(horizontal, size.height / 5.2),
            Offset(size.width - horizontal, size.height / 5.2), paint);
      } else if (lineType == 'h1') {
        canvas.drawLine(Offset(horizontal, size.height / 2.1),
            Offset(size.width - horizontal, size.height / 2.1), paint);
      } else if (lineType == 'h2') {
        canvas.drawLine(Offset(horizontal, size.height / 1.3),
            Offset(size.width - horizontal, size.height / 1.3), paint);
      } else if (lineType == 'v0') {
        canvas.drawLine(Offset(size.width / 5.2, vertical),
            Offset(size.width / 5.2, size.height - vertical - 15), paint);
      } else if (lineType == 'v1') {
        canvas.drawLine(Offset(size.width / 2 - 2, vertical),
            Offset(size.width / 2 - 2, size.height - vertical - 15), paint);
      } else {
        canvas.drawLine(Offset(size.width / 1.25, vertical),
            Offset(size.width / 1.25, size.height - vertical - 15), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
