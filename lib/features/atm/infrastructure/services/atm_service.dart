import 'package:flutter_atm/features/atm/domain/repositories/i_atm_fake_repository.dart';
import 'package:flutter_atm/features/atm/domain/services/i_atm_service.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAtmService)
@injectable
class AtmService implements IAtmService {
  AtmService(this._atmFakeRepository);

  final IAtmFakeRepository _atmFakeRepository;

  @override
  List<BankCell> get balance => _atmFakeRepository.balance;

  @override
  List<BankCell> cashWithdraw(int amount) {
    var value = amount;
    final List<BankCell> banknotes = [];
    // If there is enough money at the ATM
    if (_operationCanBePerformed(amount: value)) {
      for (final bills in _atmFakeRepository.balance) {
        // Taking money from an ATM
        while (value >= bills.denomination && bills.count != 0) {
          value -= bills.denomination;
          bills.count -= 1;
          banknotes.add(BankCell(count: 1, denomination: bills.denomination));
        }
      }
    }
    // Collect money in bundles
    return _groupBanknotes(banknotes: banknotes);
  }

  bool _operationCanBePerformed({required int amount}) {
    var balance = 0;
    var remains = amount;

    for (final bills in _atmFakeRepository.balance) {
      if (bills.count != 0) {
        // Check whether the change will remain
        while (remains >= bills.denomination) {
          remains -= bills.denomination;
        }
        // We consider the residual balance of the ATM
        balance += bills.denomination * bills.count;
      }
    }

    return balance >= amount && remains == 0;
  }

  List<BankCell> _groupBanknotes({required List<BankCell> banknotes}) {
    final List<int> denominations =
        _getBanknoteDenominations(banknotes: banknotes);
    final List<BankCell> groupedBanknotes = [];
    // Collect bills according to their value
    for (final denomination in denominations) {
      groupedBanknotes.add(
        BankCell(
          count: banknotes.fold(
              0,
              (sum, bills) =>
                  (bills.denomination == denomination) ? sum + 1 : sum),
          denomination: denomination,
        ),
      );
    }

    return groupedBanknotes;
  }

  List<int> _getBanknoteDenominations({required List<BankCell> banknotes}) {
    final List<int> denominations = [];
    for (final bills in banknotes) {
      denominations.add(bills.denomination);
    }
    // Return unique banknote denominations
    return denominations.toSet().toList();
  }
}
