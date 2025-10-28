import 'package:flutter/material.dart';

class BezierView extends StatelessWidget {
  const BezierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: BezierPainter(),
          ),
          ],
      ),
    );
  }
}

class BezierPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink.shade100
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final path = Path()
    ..moveTo(0, size.height * 0.5)
    ..quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.7, 
      size.width,
      size.height * 0.5, 
    )

    ..lineTo(size.width, 0)
    ..lineTo(0, 0)
    ..close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
