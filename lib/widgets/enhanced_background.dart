import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class EnhancedBackground extends StatefulWidget {
  const EnhancedBackground({Key? key}) : super(key: key);

  @override
  State<EnhancedBackground> createState() => _EnhancedBackgroundState();
}

class _EnhancedBackgroundState extends State<EnhancedBackground>
    with TickerProviderStateMixin {
  late AnimationController _geometryController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _geometryController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _geometryController,
      curve: Curves.linear,
    ));

    _geometryController.repeat();
  }

  @override
  void dispose() {
    _geometryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Animated geometric shapes
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return CustomPaint(
                painter: GeometricShapesPainter(
                  rotation: _rotationAnimation.value,
                ),
              );
            },
          ),
        ),

        // Floating orbs
        ...List.generate(4, (index) => _buildFloatingOrb(index)),
      ],
    );
  }

  Widget _buildFloatingOrb(int index) {
    final random = math.Random(index);
    final size = 20.0 + random.nextDouble() * 40.0;
    final startX = random.nextDouble();
    final startY = random.nextDouble();

    return Positioned(
      left: startX * MediaQuery.of(context).size.width,
      top: startY * MediaQuery.of(context).size.height,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.transparent,
            ],
          ),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .scale(
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.2, 1.2),
            duration: Duration(seconds: 3 + index),
          )
          .fadeIn(
            duration: Duration(seconds: 2 + index),
          ),
    );
  }
}

class GeometricShapesPainter extends CustomPainter {
  final double rotation;

  GeometricShapesPainter({required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw subtle geometric patterns
    _drawHexagonPattern(canvas, size, paint);
    _drawCircularPatterns(canvas, size, paint);
  }

  void _drawHexagonPattern(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white.withOpacity(0.03);

    final hexSize = 60.0;
    final rows = (size.height / (hexSize * 0.75)).ceil() + 2;
    final cols = (size.width / (hexSize * math.sqrt(3))).ceil() + 2;

    for (int row = -1; row < rows; row++) {
      for (int col = -1; col < cols; col++) {
        final offsetX = col * hexSize * math.sqrt(3) +
            (row.isOdd ? hexSize * math.sqrt(3) / 2 : 0);
        final offsetY = row * hexSize * 0.75;

        _drawHexagon(canvas, Offset(offsetX, offsetY), hexSize, paint);
      }
    }
  }

  void _drawHexagon(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();

    for (int i = 0; i < 6; i++) {
      final angle = (i * math.pi / 3) + rotation * 0.1;
      final x = center.dx + size * math.cos(angle);
      final y = center.dy + size * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawCircularPatterns(Canvas canvas, Size size, Paint paint) {
    paint.color = Colors.white.withOpacity(0.02);

    final centerX = size.width * 0.8;
    final centerY = size.height * 0.3;

    for (int i = 1; i <= 5; i++) {
      final radius = i * 80.0;
      canvas.drawCircle(
        Offset(centerX, centerY),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MouseFollowerEffect extends StatefulWidget {
  const MouseFollowerEffect({Key? key}) : super(key: key);

  @override
  State<MouseFollowerEffect> createState() => _MouseFollowerEffectState();
}

class _MouseFollowerEffectState extends State<MouseFollowerEffect>
    with TickerProviderStateMixin {
  Offset _mousePosition = const Offset(0, 0);
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (details) {
        setState(() {
          _mousePosition = details.localPosition;
        });
      },
      child: Stack(
        children: [
          // Mouse follower glow
          Positioned(
            left: _mousePosition.dx - 50,
            top: _mousePosition.dy - 50,
            child: IgnorePointer(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              )
                  .animate(
                      onPlay: (controller) => controller.repeat(reverse: true))
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.2, 1.2),
                    duration: 2000.ms,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
