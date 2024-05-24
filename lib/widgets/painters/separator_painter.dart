import 'package:flutter/material.dart';

class SeparatorPainter extends CustomPainter {
  SeparatorPainter({
    this.drawAtBottom = false,
    this.color = Colors.black,
    this.isReversed = false,
  });

  final bool drawAtBottom;
  final Color color;
  final bool isReversed;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();

    if (!drawAtBottom) handlePathTop(path, size);
    if (drawAtBottom) handlePathBottom(path, size);

    path.close();

    canvas.drawPath(path, paint);
  }

  handlePathBottom(path, size) {
    if (isReversed) {
      return drawReversedBottom(path, size);
    }

    return drawBottom(path, size);
  }

  handlePathTop(path, size) {
    if (isReversed) {
      return drawReversedTop(path, size);
    }

    return drawTop(path, size);
  }

  void drawReversedTop(Path path, Size size) {
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 3);
  }

  drawTop(path, size) {
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 3);
  }

  void drawReversedBottom(Path path, Size size) {
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 2 / 3);
  }

  drawBottom(path, size) {
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 2 / 3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
