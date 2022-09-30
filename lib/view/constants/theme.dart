import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey86,
          ),
        ),
        errorStyle: const TextStyle(fontSize: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey86,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey86,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 1,
        centerTitle: false,
        color: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 32.sm,
        ),
        bodyText2: GoogleFonts.nunitoSans().copyWith(
          color: secondaryText,
        ),
        headline3: GoogleFonts.nunitoSans().copyWith(
          color: primaryText,
          fontSize: 20.sm,
        ),
        headline4: GoogleFonts.nunitoSans().copyWith(
          color: AppColors.grey900,
          fontSize: 20.sm,
        ),
        headline5: GoogleFonts.nunitoSans().copyWith(
          color: AppColors.grey900,
          fontWeight: FontWeight.w700,
          fontSize: 16.sm,
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
