// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

abstract final class AppColors {
  static const black1 = Color(0xFF171725);
  static const softBlack = Color(0xFF252836);
  static const white1 = Color(0xFFFFF7FA);
  static const grey1 = Color(0xFFF1F1F5);
  static const grey2 = Color(0xFF92929D);
  static const grey3 = Color(0xFF696974);
  static const whiteTransparent = Color(
    0x4DFFFFFF,
  ); // Figma rgba(255, 255, 255, 0.3)
  static const blackTransparent = Color(0x4D171725);
  static const danger = Color(0xFFFF7256);
  static const warn = Color(0xFFFF8700);
  static const star = Color(0xFFFFB734);
  static const accept = Color(0xFF22B07D);
  static const info = Color(0xFF12CDD9);
  static const favColor = Color(0xFFF4649E);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black1,
    onPrimary: AppColors.white1,
    secondary: AppColors.black1,
    onSecondary: AppColors.white1,
    surface: Colors.white,
    onSurface: AppColors.black1,
    error: Colors.white,
    onError: danger,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white1,
    onPrimary: AppColors.black1,
    secondary: AppColors.white1,
    onSecondary: AppColors.black1,
    surface: AppColors.black1,
    onSurface: Colors.white,
    error: AppColors.softBlack,
    onError: AppColors.danger,
  );
}
