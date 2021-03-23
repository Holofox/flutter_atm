import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    Key? key,
    required this.controller,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;

  final ValueChanged<int>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      // Only nu
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30.0,
        height: 1.358,
        color: AtmColors.white,
      ),
      decoration: InputDecoration(
        hintText: '0',
        suffixText: '₽',
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AtmColors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AtmColors.white.withOpacity(0.7)),
        ),
      ),
      onSubmitted: (value) => onSubmitted?.call(int.tryParse(value) ?? 0),
    );
  }
}
