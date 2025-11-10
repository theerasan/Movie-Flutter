import 'package:flutter/material.dart';
import 'package:popcorn/l10n/app_localizations.dart';
import 'package:popcorn/ui/core/theme/theme.dart';

Widget getTestApp(Widget widget) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.system,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: widget),
  );
}
