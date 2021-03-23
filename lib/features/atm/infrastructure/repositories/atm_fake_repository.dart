import 'package:flutter_atm/features/atm/domain/repositories/i_atm_fake_repository.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';

class AtmFakeRepository implements IAtmFakeRepository {
  AtmFakeRepository(this._balance) {
    // Get and sort balance by denomination (ascending)
    _balance.sort((a, b) => b.denomination.compareTo(a.denomination));
  }

  final List<BankCell> _balance;

  @override
  List<BankCell> get balance => _balance;
}
