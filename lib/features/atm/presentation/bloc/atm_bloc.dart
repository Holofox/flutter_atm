import 'package:flutter/material.dart' show BuildContext;
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
  AtmBloc({required this.atmService}) : super(const Initialized());

  final IAtmService atmService;

  @override
  Future<void> close() async {
    await atmService.dispose();
    return super.close();
  }

  @override
  Stream<AtmState> mapEventToState(AtmEvent event) async* {
    yield* event.map(
      cashWithdrawn: _cashWithdrawnToState,
    );
  }

  Stream<AtmState> _cashWithdrawnToState(CashWithdrawn e) async* {
    final List<BankCell> bills = atmService.cashWithdraw(e.value);
    if (bills.isEmpty) {
      yield const OperationFailed();
    } else {
      // If the operation was successful, update the balance of the ATM
      atmService.updateBalance();
      yield BillsReturned(value: bills);
    }
  }
}

extension AtmBlocBuildContextX on BuildContext {
  AtmBloc get atmBloc => read<AtmBloc>();
}
