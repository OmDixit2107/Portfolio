import 'dart:math';
import 'package:flutter/material.dart';

class LightningAnimation extends StatefulWidget {
  const LightningAnimation({Key? key}) : super(key: key);

  @override
  State<LightningAnimation> createState() => _LightningAnimationState();
}

class _LightningAnimationState extends State<LightningAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  final Random _random = Random();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 150 + _random.nextInt(200)),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _startLightning();
  }

  void _startLightning() {
    Future.delayed(Duration(milliseconds: 2000 + _random.nextInt(3000)), () {
      if (mounted) {
        _controller.forward().then((_) {
          Future.delayed(Duration(milliseconds: 50), () {
            _controller.reverse().then((_) {
              // Sometimes add a second flash
              if (_random.nextBool()) {
                Future.delayed(Duration(milliseconds: 100), () {
                  if (mounted) {
                    _controller.forward().then((_) {
                      _controller.reverse().then((_) {
                        _startLightning();
                      });
                    });
                  }
                });
              } else {
                _startLightning();
              }
            });
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: LightningPainter(),
          ),
        );
      },
    );
  }
}

class LightningPainter extends CustomPainter {
  final Random _random = Random();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.95)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Create multiple lightning bolts for more dramatic effect
    for (int bolt = 0; bolt < 2; bolt++) {
      final path = Path();

      // Starting point (top of screen)
      double startX = size.width * (0.2 + _random.nextDouble() * 0.6);
      if (bolt == 1) startX = size.width * (0.3 + _random.nextDouble() * 0.4);

      double currentX = startX;
      double currentY = _random.nextDouble() * 50; // Start slightly below top

      path.moveTo(currentX, currentY);

      // Create more jagged lightning pattern
      int segments = 6 + _random.nextInt(4);
      for (int i = 0; i < segments; i++) {
        currentY += (size.height * 0.8) / segments;

        // Add more dramatic zigzag
        double direction = (_random.nextDouble() - 0.5) * 2;
        currentX += direction * (30 + _random.nextDouble() * 40);
        currentX = currentX.clamp(50.0, size.width - 50.0);

        path.lineTo(currentX, currentY);

        // Add some branches
        if (i > 2 && _random.nextDouble() > 0.7) {
          final branchPath = Path();
          branchPath.moveTo(currentX, currentY);
          double branchX = currentX + (_random.nextDouble() - 0.5) * 60;
          double branchY = currentY + 30 + _random.nextDouble() * 50;
          branchPath.lineTo(branchX, branchY);

          // Draw branch
          canvas.drawPath(branchPath, paint);
        }
      }

      // Main lightning bolt
      canvas.drawPath(path, paint);

      // Silver glow effect
      paint.strokeWidth = 4.0;
      paint.color = const Color(0xFFC0C0C0).withOpacity(0.6); // Silver
      canvas.drawPath(path, paint);

      paint.strokeWidth = 8.0;
      paint.color = const Color(0xFFC0C0C0).withOpacity(0.3); // Silver glow
      canvas.drawPath(path, paint);

      paint.strokeWidth = 15.0;
      paint.color = Colors.white.withOpacity(0.1); // Outer white glow
      canvas.drawPath(path, paint);

      // Reset for next bolt
      paint.strokeWidth = 2.0;
      paint.color = Colors.white.withOpacity(0.95);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
