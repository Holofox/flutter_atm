part of 'atm_bloc.dart';

@freezed
class AtmState with _$AtmState {
  const factory AtmState.initialized() = Initialized;

  const factory AtmState.billsReturned({
    required List<BankCell> value,
  }) = BillsReturned;

  const factory AtmState.operationFailed() = OperationFailed;
}
