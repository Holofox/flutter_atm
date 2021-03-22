import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';

abstract class IAtmService {
  /// Allows you to watch the balance change
  Stream<List<BankCell>> watchBalance();

  /// Withdraws cash from an ATM
  List<BankCell> cashWithdraw(int amount);

  /// Updates the ATM balance
  void updateBalance();

  /// Called for the closure of the stream
  /// Be sure to close the stream to prevent memory leaks!
  Future<void> dispose();
}
