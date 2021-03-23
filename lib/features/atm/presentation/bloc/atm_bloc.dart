import 'package:flutter/material.dart' show BuildContext, TextEditingController;
import 'package:flutter_atm/features/atm/domain/services/i_atm_service.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'atm_bloc.freezed.dart';

part 'atm_event.dart';

part 'atm_state.dart';

@injectable
class AtmBloc extends Bloc<AtmEvent, AtmState> {
  AtmBloc(this._atmService, {@factoryParam AtmState? state})
      : super(state ?? AtmState.initial());

  final IAtmService _atmService;

  @override
  Stream<AtmState> mapEventToState(AtmEvent event) async* {
    yield* event.map(
      started: _startedToState,
      withdrawn: _cashWithdrawnToState,
    );
  }

  Stream<AtmState> _startedToState(AtmStarted event) async* {
    yield AtmInitialized(
      controller: state.controller,
      balance: _atmService.balance,
    );
  }

  Stream<AtmState> _cashWithdrawnToState(AtmWithdrawn event) async* {
    final amount = int.tryParse(state.controller.text) ?? 0;
    final List<BankCell> bills = _atmService.cashWithdraw(amount);
    if (bills.isEmpty) {
      yield AtmFailed(
        controller: state.controller,
        balance: state.balance,
      );
    } else {
      yield AtmBillsReturned(
        controller: state.controller,
        balance: _atmService.balance,
        value: bills,
      );
    }
  }
}

extension AtmBlocBuildContextX on BuildContext {
  AtmBloc get atmBloc => read<AtmBloc>();
}
