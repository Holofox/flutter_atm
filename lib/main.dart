import 'package:flutter/material.dart';
import 'package:flutter_atm/features/atm/infrastructure/constants/atm_colors.dart';
import 'package:flutter_atm/features/atm/presentation/bloc/atm_bloc.dart';
import 'package:flutter_atm/features/atm/presentation/pages/atm_page.dart';
import 'package:flutter_atm/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureInjection();
  return runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        cardColor: AtmColors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AtmColors.white,
          selectionColor: AtmColors.primary,
        ),
        accentColor: AtmColors.accent,
        buttonColor: AtmColors.accent,
        hintColor: AtmColors.white,
      ),
      home: BlocProvider(
        create: (_) => getIt<AtmBloc>()..add(const AtmStarted()),
        child: const AtmPage(),
      ),
    );
  }
}
