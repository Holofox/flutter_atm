import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/presentation/bloc/atm_bloc.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/animations/wave_animation.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/backgrounds/gradient_background.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/cards/amount_input_card.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/cards/balance_card.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/cards/operation_status_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AtmPage extends StatelessWidget {
  const AtmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM'),
        centerTitle: false,
        flexibleSpace: const GradientBackground(),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<AtmBloc, AtmState>(
          builder: _atmStateBuilder,
        ),
      ),
      floatingActionButton: const WaveAnimation(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _atmStateBuilder(BuildContext context, AtmState state) {
    return Column(
      children: <Widget>[
        const AmountInputCard(),
        state.map(
          initialized: (_) => const SizedBox(),
          billsReturned: (s) => BalanceCard(
            categoryName: 'The ATM issued the following bills',
            items: s.value,
          ),
          failed: (_) => const OperationStatusCard(
            message: 'The ATM cannot issue\nthe requested amount',
          ),
        ),
        BalanceCard(
          categoryName: 'ATM balance',
          items: state.balance,
        )
      ],
    );
  }
}
