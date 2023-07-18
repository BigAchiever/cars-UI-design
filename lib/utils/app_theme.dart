import 'package:flutter/material.dart';

import 'app_color_extension.dart';
import 'app_typography.dart';
import 'theme_extension.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  //
  // Light theme
  //

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.black),
      ),
      extensions: [
        _lightAppColors,
        _lightTextTheme,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff1E3859),
    onPrimary: Colors.grey.shade700,
    secondary: const Color(0xff39506D),
    onSecondary: Colors.black,
    error: const Color(0xffF6F6DE),
    onError: const Color(0xffD9BA5F),
    background: const Color(0xffC8AF63),
    onBackground: const Color(0xffEFEFD8),
    surface: Colors.white,
    onSurface: Colors.black,
    drawerColor: const Color(0xffDBDBC5),
  );

  static final _lightTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _lightAppColors.onBackground),
    body2: AppTypography.body2.copyWith(color: _lightAppColors.onBackground),
    body3: AppTypography.body3.copyWith(color: _lightAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.black),
    h2: AppTypography.h2.copyWith(color: Colors.black),
  );

  //
  // Dark theme
  //

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: defaultTheme.textTheme.copyWith(
        // Default text style for Text widget.
        bodyMedium: AppTypography.body1.copyWith(color: Colors.white),
      ),
      extensions: [
        _darkAppColors,
        _darkTextTheme,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xff1E3859),
    onPrimary: Colors.grey,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffF6F6DE),
    onError: const Color(0xffAF9E68),
    background: const Color(0xff121212),
    onBackground: const Color(0xffEFEFD8),
    surface: const Color(0xff121212),
    onSurface: Colors.white,
    drawerColor: const Color(0xffDBDBC5),
  );

  static final _darkTextTheme = SimpleAppTextThemeExtension(
    body1: AppTypography.body1.copyWith(color: _darkAppColors.onBackground),
    body2: AppTypography.body2.copyWith(color: _darkAppColors.onBackground),
    body3: AppTypography.body3.copyWith(color: _darkAppColors.onBackground),
    h1: AppTypography.h1.copyWith(color: Colors.white),
    h2: AppTypography.h2.copyWith(color: Colors.white),
  );
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  SimpleAppTextThemeExtension get appTextTheme =>
      extension<SimpleAppTextThemeExtension>() ?? AppTheme._lightTextTheme;
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
