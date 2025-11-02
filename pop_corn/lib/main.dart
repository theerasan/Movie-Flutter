import 'package:flutter/material.dart';
import 'package:pop_corn/presentation/movie_list/movie.dart';
import 'package:pop_corn/presentation/movie_list/movie_list.dart';
import 'package:pop_corn/routing/router.dart';
import 'package:pop_corn/ui/core/theme/theme.dart';

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
      title: 'Popcorn',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router(),
    );
  }
}