import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';
import 'package:flutter_atm/features/atm/presentation/bloc/atm_bloc.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/animations/wave_animation.dart';

class HomeControls extends StatefulWidget {
  const HomeControls({
    Key? key,
  }) : super(key: key);

  @override
  _HomeControlsState createState() => _HomeControlsState();
}

class _HomeControlsState extends State<HomeControls> {
  final _controller = TextEditingController();
  int inputAmount = 0;

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
              Transform.rotate(angle: -pi, child: WaveAnimation()),
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
            onPressed: () => _dispatchCashWithdrawn(context),
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
          child: TextField(
            controller: _controller,
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
              hintText: inputAmount.toString(),
              suffixText: '₽',
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AtmColors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AtmColors.white.withOpacity(0.7)),
              ),
            ),
            onChanged: (value) {
              inputAmount = int.parse(value);
            },
            onSubmitted: (_) => _dispatchCashWithdrawn(context),
          ),
        ),
      ],
    );
  }

  void _dispatchCashWithdrawn(BuildContext context) {
    return context.atmBloc.add(CashWithdrawn(value: inputAmount));
  }
}
