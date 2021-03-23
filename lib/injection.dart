import 'package:flutter_atm/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
GetIt configureInjection() => $initGetIt(getIt);
