import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';
import 'package:flutter_atm/features/atm/domain/repositories/i_atm_fake_repository.dart';

class AtmFakeRepository implements IAtmFakeRepository {
  const AtmFakeRepository(this._balance);

  final List<BankCell> _balance;

  @override
  List<BankCell> getBalance() => _balance;
}
