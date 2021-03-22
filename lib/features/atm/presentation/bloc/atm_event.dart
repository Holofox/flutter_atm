part of 'atm_bloc.dart';

@freezed
class AtmEvent with _$AtmEvent {
  const factory AtmEvent.cashWithdrawn({
    required int value,
  }) = CashWithdrawn;
}
