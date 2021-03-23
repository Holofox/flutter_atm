import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/animations/curve_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedWave extends StatelessWidget {
  const AnimatedWave({
    Key? key,
    required this.height,
    required this.speed,
    required this.color,
    this.offset = 0,
  }) : super(key: key);

  final double height;
  final double speed;
  final double offset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: height,
          width: constraints.biggest.width,
          child: LoopAnimation<double>(
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, child, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(
                  value: value + offset,
                  color: color,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
