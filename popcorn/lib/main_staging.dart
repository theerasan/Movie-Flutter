import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:popcorn/config/dependencies.dart';
import 'package:popcorn/main.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(providers: providersRemote, child: const PopcornApp()));
}
