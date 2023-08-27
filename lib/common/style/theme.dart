import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      //状态栏颜色
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xFF5F84FF),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xFF4D4D4D),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
