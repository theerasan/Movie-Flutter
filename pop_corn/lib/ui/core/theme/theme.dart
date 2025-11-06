// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_corn/ui/tag_chip.dart';
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
      fontWeight: FontWeight.w500,
      color: AppColors.grey3,
      fontFamily: _fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColors.grey3,
      fontFamily: _fontFamily,
    ),
  );

  static final _appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w900,
      fontFamily: _fontFamily,
    ),
  );

  static const _inputDecorationTheme = InputDecorationTheme(
    hintStyle: TextStyle(
      // grey3 works for both light and dark themes
      color: AppColors.grey3,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarTheme,
    extensions: [
      TagChipTheme(
        chipColor: AppColors.whiteTransparent,
        onChipColor: Colors.white,
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarTheme,
    extensions: [
      TagChipTheme(
        chipColor: AppColors.blackTransparent,
        onChipColor: Colors.white,
      ),
    ],
  );
}
