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
        unselectedWidgetColor: Colors.white,
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Colors.white,
          prefixIconColor: const Color(0xFF6C6C6C),
          hintStyle: GoogleFonts.nunitoSans().copyWith(
            color: AppColors.hintColor,
            fontSize: 13,
          ),
          filled: true,
          fillColor: AppColors.textFieldColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 28.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textFieldColor,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 13,
          ),
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
          errorMaxLines: 1,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
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
          bodyLarge: GoogleFonts.nunitoSans().copyWith(
            color: primaryText,
            fontSize: 14,
          ),
          bodyMedium: GoogleFonts.nunitoSans().copyWith(
            color: primaryText,
            fontSize: 14,
          ),
          displayLarge: GoogleFonts.nunitoSans().copyWith(
            color: primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 32.sp,
          ),
          displaySmall: GoogleFonts.nunitoSans().copyWith(
            color: primaryText,
            fontSize: 20.sp,
          ),
          headlineMedium: GoogleFonts.nunitoSans().copyWith(
            color: AppColors.grey900,
            fontSize: 20.sp,
          ),
          headlineSmall: GoogleFonts.nunitoSans().copyWith(
            color: AppColors.grey900,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }));
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
