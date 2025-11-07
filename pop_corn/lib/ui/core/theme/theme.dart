// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

abstract final class AppTheme {
  static final _fontFamily = GoogleFonts.montserrat().fontFamily;

  static final _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamily,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColors.grey2,
      fontFamily: _fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey2,
      fontFamily: _fontFamily,
    ),
  );

  static final _appBarLightTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      fontFamily: _fontFamily,
      color: AppColors.black1,
    ),
  );

  static final _appBarDarkTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.black1,
    surfaceTintColor: Colors.black,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      fontFamily: _fontFamily,
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
