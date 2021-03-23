import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [AtmColors.primary, AtmColors.primarySecond],
        ),
      ),
    );
  }
}
