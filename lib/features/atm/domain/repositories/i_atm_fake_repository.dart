import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';

abstract class IAtmFakeRepository {
  /// Gets the List<BankCell> which was gotten the last time.
  /// In a real application, use secure data storage!
  List<BankCell> get balance;
}
