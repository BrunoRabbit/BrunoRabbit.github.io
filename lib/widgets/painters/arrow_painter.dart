import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final Animation<double> animation;

  ArrowPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    double progress = animation.value;

    path.moveTo(0, size.height / 2);
    path.lineTo(size.width * progress, size.height / 2);

    if (progress > 0) {
      double arrowHeadLength = 8;
      double arrowX = size.width * progress;
      double arrowY = size.height / 2;

      path.moveTo(arrowX, arrowY);
      path.lineTo(
        arrowX + arrowHeadLength * (-progress * 0.6),
        arrowY - arrowHeadLength * (progress * 0.6),
      );

      path.moveTo(arrowX, arrowY);
      path.lineTo(
        arrowX + arrowHeadLength * (-progress * 0.6),
        arrowY - arrowHeadLength * (-progress * 0.6),
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
