import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.purple,
      listTileTheme: const ListTileThemeData(iconColor: Colors.purple));
}
