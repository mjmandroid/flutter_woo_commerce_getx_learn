import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark, //状态栏颜色
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
