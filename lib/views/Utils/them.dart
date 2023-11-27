import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

abstract class AppColors {
  static const primary1 = Color(0xFFD32F2F);

  static const accent = Color.fromARGB(255, 235, 63, 15);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textColorHeader = Color.fromARGB(255, 160, 115, 251);
  static const textColorBlackBold = Colors.black;
  static Color textColorBlackRegular = Colors.black.withOpacity(0.7);
  static const textColorWhiteBold = Colors.white;
  static Color textColorWhiteRegular = Colors.white.withOpacity(0.6);
  static const textFaded = Color.fromARGB(255, 194, 219, 209);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const cardLight = Colors.white;
  static const cardDark = Color.fromARGB(255, 44, 45, 45);
  static const progressIndicatorDark = Color(0xFFF9FAFE);
  static const progressIndicatorLight = Color(0xFF303334);
  static const scaffoldBackgroundColor = Color.fromARGB(255, 241, 241, 241);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = Color.fromARGB(255, 71, 182, 135);
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        primaryColor: AppColors.primary1,
        cardColor: AppColors.cardLight,
        cardTheme: const CardTheme(color: AppColors.cardLight),
        dividerColor: Colors.black,
        hoverColor: AppColors.textColorBlackBold,
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.tajawalTextTheme().apply(bodyColor: AppColors.primary1),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF114B5F),
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
            foregroundColor: Color(0x003a3b3c),
            backgroundColor: AppColors.primary1),
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(color: AppColors.textColorBlackBold),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary1),
        colorScheme: const ColorScheme.light().copyWith(secondary: accentColor),
        bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.primary1),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        primaryColor: const Color.fromARGB(255, 238, 236, 236),
        cardColor: const Color.fromARGB(255, 58, 59, 59),
        cardTheme: const CardTheme(color: AppColors.cardDark),
        dividerColor: const Color.fromARGB(222, 236, 247, 247),
        hoverColor: AppColors.textColorWhiteBold,
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.tajawalTextTheme()
            .apply(bodyColor: AppColors.textLigth),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.progressIndicatorDark,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(146, 36, 38, 40),
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textColorWhiteBold),
        ),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(231, 255, 255, 255)),
        bottomAppBarTheme:
            const BottomAppBarTheme(color: Color.fromARGB(146, 19, 20, 21)),
        colorScheme: const ColorScheme.dark()
            .copyWith(secondary: accentColor)
            .copyWith(background: const Color.fromARGB(255, 0, 0, 0)),
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.textLigth,
          backgroundColor: Color.fromARGB(146, 36, 38, 40),
        ),
      );
}
