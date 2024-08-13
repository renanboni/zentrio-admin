
import 'package:flutter/material.dart';

class StepCompletedState extends StatelessWidget {
  const StepCompletedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 12,
      ),
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