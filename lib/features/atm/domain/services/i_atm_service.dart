import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';

abstract class IAtmService {
  /// Allows you to watch the balance change
  List<BankCell> get balance;

  /// Withdraws cash from an ATM
  List<BankCell> cashWithdraw(int amount);
}
