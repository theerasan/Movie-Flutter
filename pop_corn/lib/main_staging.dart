import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pop_corn/config/dependencies.dart';
import 'package:pop_corn/main.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: providersRemote, child: const PopcornApp()));
}
