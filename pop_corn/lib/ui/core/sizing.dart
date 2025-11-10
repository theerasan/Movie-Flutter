import 'package:flutter/cupertino.dart';

abstract final class AppSizing {
  static const smallBreakPoint = 600.0;

  static const xs = 4.0;
  static const s = 8.0;
  static const m = 12.0;
  static const l = 16.0;
  static const xl = 20.0;
  static const xxl = 24.0;
  static const coverSmall = 155.0;
  static const coverLarge = 275.0;
  static const errorImageSize = 200.0;
}

abstract final class BoxSizing {
  static const xs = SizedBox(width: AppSizing.xs, height: AppSizing.xs);
  static const s = SizedBox(width: AppSizing.s, height: AppSizing.s);
  static const m = SizedBox(width: AppSizing.m, height: AppSizing.m);
  static const l = SizedBox(width: AppSizing.l, height: AppSizing.l);
  static const xl = SizedBox(width: AppSizing.xl, height: AppSizing.xl);
  static const xxl = SizedBox(width: AppSizing.xxl, height: AppSizing.xxl);
}
