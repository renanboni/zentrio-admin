
import 'package:flutter/material.dart';

class StepEditingState extends StatelessWidget {
  const StepEditingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blueAccent,
              width: 1,
            ),
          ),
        ),
        Positioned(
          left: 8,
          child: CustomPaint(
            size: const Size(4, 12),
            painter: RightSemiCirclePainter(),
          ),
        ),
      ],
    );
  }
}

class RightSemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.arcToPoint(
      Offset(0, size.height),
      radius: Radius.circular(size.width),
      clockwise: true,
    );
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}