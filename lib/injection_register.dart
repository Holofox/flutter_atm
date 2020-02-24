import 'package:flutter_atm/features/atm/data/models/bank_cell.dart';
import 'package:flutter_atm/features/atm/domain/providers/i_atm_fake_provider.dart';
import 'package:injectable/injectable.dart';

import 'features/atm/data/providers/atm_fake_provider.dart';
import 'injection.dart';

@registerModule
abstract class InjectionRegister {
  @RegisterAs(IAtmFakeProvider, env: Env.prod)
  @lazySingleton
  AtmFakeProvider get atmFakeProvider => AtmFakeProvider(
      balance: [
        BankCell(count: 50, denomination: 100),
        BankCell(count: 100, denomination: 200),
        BankCell(count: 5, denomination: 500),
        BankCell(count: 10, denomination: 1000),
        BankCell(count: 100, denomination: 2000),
        BankCell(count: 10, denomination: 5000),
      ]
  );
}