import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class TopClouds extends StatefulWidget {
  const TopClouds({Key? key}) : super(key: key);

  @override
  State<TopClouds> createState() => _TopCloudsState();
}

class _TopCloudsState extends State<TopClouds> with TickerProviderStateMixin {
  late List<CloudData> _clouds;
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _initializeClouds();
  }

  void _initializeClouds() {
    _clouds = [];
    _controllers = [];

    // Create 5 clouds with different properties
    final cloudConfigs = [
      {'top': 20.0, 'size': 100.0, 'speed': 25, 'opacity': 0.12},
      {'top': 60.0, 'size': 80.0, 'speed': 35, 'opacity': 0.15},
      {'top': 40.0, 'size': 120.0, 'speed': 45, 'opacity': 0.10},
      {'top': 80.0, 'size': 90.0, 'speed': 30, 'opacity': 0.18},
      {'top': 100.0, 'size': 70.0, 'speed': 40, 'opacity': 0.14},
    ];

    for (int i = 0; i < cloudConfigs.length; i++) {
      final config = cloudConfigs[i];
      final controller = AnimationController(
        duration: Duration(seconds: config['speed'] as int),
        vsync: this,
      );

      _controllers.add(controller);
      _clouds.add(CloudData(
        top: config['top'] as double,
        size: config['size'] as double,
        opacity: config['opacity'] as double,
        controller: controller,
        delayStart: i * 3, // Stagger start times
      ));

      // Start each cloud with a delay
      Future.delayed(Duration(seconds: i * 3), () {
        if (mounted) {
          controller.repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: _clouds.map((cloud) {
        return AnimatedBuilder(
          animation: cloud.controller,
          builder: (context, child) {
            // Calculate position using TweenAnimationBuilder approach like rain_cloud.dart
            double progress = cloud.controller.value;
            double startPosition = size.width + cloud.size;
            double endPosition = -cloud.size;
            double currentPosition =
                startPosition + (endPosition - startPosition) * progress;

            return Positioned(
              top: cloud.top,
              left: currentPosition,
              child: Container(
                width: cloud.size,
                height: cloud.size * 0.6,
                child: CustomPaint(
                  painter: EnhancedCloudPainter(
                    color: Colors.white.withOpacity(cloud.opacity),
                    animationValue: progress,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(
                    delay: Duration(seconds: cloud.delayStart),
                    duration: const Duration(milliseconds: 800),
                  )
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    delay: Duration(seconds: cloud.delayStart),
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.elasticOut,
                  ),
            );
          },
        );
      }).toList(),
    );
  }
}

class CloudData {
  final double top;
  final double size;
  final double opacity;
  final AnimationController controller;
  final int delayStart;

  CloudData({
    required this.top,
    required this.size,
    required this.opacity,
    required this.controller,
    required this.delayStart,
  });
}

class EnhancedCloudPainter extends CustomPainter {
  final Color color;
  final double animationValue;

  EnhancedCloudPainter({
    required this.color,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Add subtle breathing effect based on animation
    final breathingScale =
        1.0 + (math.sin(animationValue * 2 * math.pi * 3) * 0.05);

    canvas.save();
    canvas.scale(breathingScale);

    // Create more organic cloud shape
    final center = Offset(size.width / 2, size.height / 2);
    final baseRadius = size.width / 10;

    // Main cloud body (larger)
    _drawCloudPuff(canvas, center, baseRadius * 2.2, paint);

    // Left side puffs
    _drawCloudPuff(
      canvas,
      Offset(center.dx - baseRadius * 1.8, center.dy + baseRadius * 0.4),
      baseRadius * 1.6,
      paint,
    );

    _drawCloudPuff(
      canvas,
      Offset(center.dx - baseRadius * 2.8, center.dy - baseRadius * 0.2),
      baseRadius * 1.2,
      paint,
    );

    // Right side puffs
    _drawCloudPuff(
      canvas,
      Offset(center.dx + baseRadius * 2.0, center.dy + baseRadius * 0.3),
      baseRadius * 1.4,
      paint,
    );

    _drawCloudPuff(
      canvas,
      Offset(center.dx + baseRadius * 2.8, center.dy - baseRadius * 0.1),
      baseRadius * 1.0,
      paint,
    );

    // Top puffs for height
    _drawCloudPuff(
      canvas,
      Offset(center.dx - baseRadius * 0.5, center.dy - baseRadius * 1.2),
      baseRadius * 1.3,
      paint,
    );

    _drawCloudPuff(
      canvas,
      Offset(center.dx + baseRadius * 0.8, center.dy - baseRadius * 1.4),
      baseRadius * 1.1,
      paint,
    );

    // Additional small puffs for organic feel
    _drawCloudPuff(
      canvas,
      Offset(center.dx - baseRadius * 1.2, center.dy - baseRadius * 0.8),
      baseRadius * 0.8,
      paint,
    );

    canvas.restore();
  }

  void _drawCloudPuff(
      Canvas canvas, Offset center, double radius, Paint paint) {
    // Add slight random variation to make clouds more organic
    final path = Path();
    const segments = 20;

    for (int i = 0; i <= segments; i++) {
      final angle = (i / segments) * 2 * math.pi;
      final variation = 1.0 + (math.sin(angle * 3 + animationValue * 2) * 0.1);
      final x = center.dx + math.cos(angle) * radius * variation;
      final y = center.dy +
          math.sin(angle) * radius * variation * 0.8; // Slightly flattened

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Weather effect - subtle rain drops from clouds
class CloudRainEffect extends StatefulWidget {
  const CloudRainEffect({Key? key}) : super(key: key);

  @override
  State<CloudRainEffect> createState() => _CloudRainEffectState();
}

class _CloudRainEffectState extends State<CloudRainEffect>
    with TickerProviderStateMixin {
  late List<AnimationController> _rainControllers;
  final int numberOfDrops = 15;

  @override
  void initState() {
    super.initState();
    _rainControllers = [];

    for (int i = 0; i < numberOfDrops; i++) {
      final controller = AnimationController(
        duration: Duration(milliseconds: 1500 + (i * 100)),
        vsync: this,
      );

      _rainControllers.add(controller);

      // Start rain drops with random delays
      Future.delayed(Duration(milliseconds: math.Random().nextInt(3000)), () {
        if (mounted) {
          controller.repeat();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _rainControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: List.generate(numberOfDrops, (index) {
        return AnimatedBuilder(
          animation: _rainControllers[index],
          builder: (context, child) {
            final random = math.Random(index);
            final startX = random.nextDouble() * size.width;
            final progress = _rainControllers[index].value;

            return Positioned(
              left: startX,
              top:
                  120 + (progress * size.height * 0.3), // Start from cloud area
              child: Container(
                width: 2,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
