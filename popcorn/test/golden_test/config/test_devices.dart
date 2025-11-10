import 'package:flutter/cupertino.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const _phone = Device(
  name: 'phone',
  size: Size(414, 896),
  devicePixelRatio: 1.0,
  safeArea: EdgeInsets.only(top: 44, bottom: 34),
);

const _phoneLandscape = Device(
  name: 'phoneLandscape',
  size: Size(896, 414),
  devicePixelRatio: 1.0,
  safeArea: EdgeInsets.only(top: 44, bottom: 34),
);

final devices = [
  _phone,
  _phone.copyWith(name: 'phoneDark', brightness: Brightness.dark),
  _phoneLandscape,
  _phoneLandscape.copyWith(
    name: 'phoneLandscapeDark',
    brightness: Brightness.dark,
  ),
];
