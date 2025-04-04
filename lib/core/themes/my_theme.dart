import 'package:flutter/material.dart';
import 'package:tradao/core/themes/app_color.dart';

class MyTheme extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;

  ThemeData get getTheme => ThemeData(
      scaffoldBackgroundColor:
          isDark ? AppColor.backgroundColorDark : Colors.white,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorSchemeSeed: AppColor.primary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColor.primary),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
        ),
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ));

  change() {
    if (_isDark) {
      _isDark = false;
    } else {
      _isDark = true;
    }
    notifyListeners();
  }
}
