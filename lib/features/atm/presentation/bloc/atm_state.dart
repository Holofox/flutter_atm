part of 'atm_bloc.dart';

@freezed
class AtmState with _$AtmState {
  const factory AtmState.initialized({
    required List<BankCell> balance,
    required TextEditingController controller,
  }) = AtmInitialized;

  const factory AtmState.billsReturned({
    required List<BankCell> balance,
    required TextEditingController controller,
    required List<BankCell> value,
  }) = AtmBillsReturned;

  const factory AtmState.failed({
    required List<BankCell> balance,
    required TextEditingController controller,
  }) = AtmFailed;

  factory AtmState.initial({
    List<BankCell>? balance,
    TextEditingController? controller,
  }) {
    return AtmInitialized(
      balance: balance ?? [],
      controller: controller ?? TextEditingController(),
    );
  }
}
