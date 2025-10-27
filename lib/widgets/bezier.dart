import 'package:flutter/material.dart';

class BezierView extends StatelessWidget {
  const BezierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BezierPainter(),
        size: Size.infinite, // usa toda la pantalla
      ),
    );
  }
}

class BezierPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.5); // punto inicial
    path.quadraticBezierTo(
      size.width * 0.5, size.height * 0.2, // punto de control
      size.width, size.height * 0.5,       // punto final
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
