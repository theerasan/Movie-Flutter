// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class AppTheme {

  static final _textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.grey2,
      fontFamily: 'Montserrat',
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey2,
      fontFamily: 'Montserrat',
    ),
  );

  static final _appBarLightTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: AppColors.black1,
    ),
  );

  static final _appBarDarkTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.black1,
    surfaceTintColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: AppColors.grey1,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      color: AppColors.grey3,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );

  static const _progressIndicatorTheme = ProgressIndicatorThemeData(
    color: AppColors.info
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarLightTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarDarkTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
  );
}
