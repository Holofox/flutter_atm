import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';
import 'package:flutter_atm/features/atm/presentation/bloc/atm_bloc.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/animations/wave_animation.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/controls/amount_textfield.dart';

class AmountInputCard extends StatelessWidget {
  const AmountInputCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const Border(),
      margin: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Transform.rotate(angle: -pi, child: const WaveAnimation()),
              _buildInputBody(context),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              minimumSize: const Size(200.0, 60.0),
              primary: Theme.of(context).accentColor,
            ),
            onPressed: () => context.atmBloc.add(const AtmWithdrawn()),
            child: const Text(
              'Give out amount',
              style: TextStyle(
                fontSize: 16.0,
                color: AtmColors.white,
              ),
            ),
          ),
          const SizedBox(height: 26.0),
        ],
      ),
    );
  }

  Widget _buildInputBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 26.0, bottom: 5.0),
          child: Text(
            'Enter the amount',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              height: 1.179,
              color: AtmColors.white,
            ),
          ),
        ),
        SizedBox(
          width: 200.0,
          child: AmountTextField(
            controller: context.atmBloc.state.controller,
            onSubmitted: (amount) => context.atmBloc.add(const AtmWithdrawn()),
          ),
        ),
      ],
    );
  }
}
