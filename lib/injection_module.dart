import 'package:flutter_atm/features/atm/domain/repositories/i_atm_fake_repository.dart';
import 'package:flutter_atm/features/atm/infrastructure/models/bank_cell.dart';
import 'package:flutter_atm/features/atm/infrastructure/repositories/atm_fake_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModule {
  @LazySingleton(as: IAtmFakeRepository)
  AtmFakeRepository get atmFakeRepository {
    return AtmFakeRepository(
      [
        BankCell(count: 50, denomination: 100),
        BankCell(count: 100, denomination: 200),
        BankCell(count: 5, denomination: 500),
        BankCell(count: 10, denomination: 1000),
        BankCell(count: 100, denomination: 2000),
        BankCell(count: 10, denomination: 5000),
      ],
    );
  }
}
