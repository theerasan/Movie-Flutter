import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pop_corn/main.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(PopcornApp());
}