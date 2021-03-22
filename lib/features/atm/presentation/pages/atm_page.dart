import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';
import 'package:flutter_atm/features/atm/presentation/bloc/atm_bloc.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/animations/wave_animation.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/builders/atm_list_builder.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/gradient_background.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/home_controls.dart';
import 'package:flutter_atm/features/atm/presentation/widgets/message_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AtmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATM'),
        centerTitle: false,
        flexibleSpace: const GradientBackground(),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
      floatingActionButton: WaveAnimation(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        const HomeControls(),
        BlocBuilder<AtmBloc, AtmState>(
          builder: _atmStateBuilder,
        ),
        _buildBankBalance(context),
      ],
    );
  }

  Widget _atmStateBuilder(BuildContext context, AtmState state) {
    return state.map(
      initialized: (_) => const SizedBox(),
      billsReturned: (s) => AtmListBuilder(
        categoryName: 'The ATM issued the following bills',
        items: s.value,
      ),
      operationFailed: (_) => const MessageDisplay(
        message: 'The ATM cannot issue\nthe requested amount',
      ),
    );
  }

  StreamBuilder<List<BankCell>> _buildBankBalance(BuildContext context) {
    return StreamBuilder(
      stream: context.atmBloc.atmService.watchBalance(),
      builder: (context, AsyncSnapshot<List<BankCell>> snapshot) {
        return AtmListBuilder(
          categoryName: 'ATM balance',
          items: snapshot.data ?? List.empty(),
        );
      },
    );
  }
}
