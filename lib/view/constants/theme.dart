import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class AppTheme {
  static ThemeData createTheme({
    Brightness? brightness,
    Color? background,
    Color? primaryText,
    Color? secondaryText,
    Color? accentColor,
    Color? divider,
    Color? buttonBackground,
    Color? buttonText,
    Color? cardBackground,
    Color? disabled,
    Color? error,
    Color? primaryColor,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.nunitoSans().copyWith(
          color: AppColors.hintColor,
          fontSize: 14,
        ),
        filled: true,
        fillColor: AppColors.textFieldColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldColor,
          ),
        ),
        errorStyle: const TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textFieldColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        color: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 16,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 14,
        ),
        bodyText2: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 16,
        ),
        headline1: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        headline3: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 20,
        ),
        headline4: GoogleFonts.nunitoSans().copyWith(
          color: AppColors.grey900,
          fontSize: 20,
        ),
        headline5: GoogleFonts.nunitoSans().copyWith(
          color: AppColors.grey900,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        primaryText: AppColors.textColor,
        secondaryText: AppColors.grey600,
        buttonBackground: Colors.black38,
        buttonText: Colors.black,
        error: Colors.red,
        primaryColor: AppColors.primaryColor,
      );
}
