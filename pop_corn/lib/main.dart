import 'package:flutter/material.dart';
import 'package:pop_corn/routing/router.dart';
import 'package:pop_corn/ui/core/theme/theme.dart';

import 'l10n/app_localizations.dart';
import 'main_development.dart' as development;

void main() {
  development.main();
}

class PopcornApp extends StatelessWidget {
  const PopcornApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Popcorn',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router(),
    );
  }
}
