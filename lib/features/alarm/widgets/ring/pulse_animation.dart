import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class PulseAnimation extends StatefulWidget {
  final Widget? child;

  const PulseAnimation({super.key, this.child});

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _PulsePainter(_controller.value),
          child: widget.child,
        );
      },
    );
  }
}

class _PulsePainter extends CustomPainter {
  final double animationValue;

  _PulsePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width > size.height ? size.width : size.height;

    // Draw 3 concentric circles at different phases
    _drawCircle(canvas, center, maxRadius, (animationValue) % 1.0);
    _drawCircle(canvas, center, maxRadius, (animationValue + 0.33) % 1.0);
    _drawCircle(canvas, center, maxRadius, (animationValue + 0.66) % 1.0);
  }

  void _drawCircle(Canvas canvas, Offset center, double maxRadius, double progress) {
    // Progress is 0.0 to 1.0
    final radius = maxRadius * progress;
    // Fade out as it expands
    final opacity = (1.0 - progress).clamp(0.0, 1.0) * 0.15; // Max 15% opacity so it's very subtle

    final paint = Paint()
      ..color = AppTheme.accent.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0 + (4.0 * (1.0 - progress)); // Gets thinner as it expands

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _PulsePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
