import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';

class OperationStatusCard extends StatelessWidget {
  const OperationStatusCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: const Border(),
      margin: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 60.0,
            top: 41.0,
            right: 60.0,
            bottom: 45.0,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 18.0,
              height: 1.2148,
              color: AtmColors.accent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
