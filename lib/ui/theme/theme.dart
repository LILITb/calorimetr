import 'package:caloriegram/ui/theme/colors.dart';
import 'package:flutter/material.dart';

final caloryTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.green,
  primaryColor: AppColors.appThemeColor,
  focusColor: AppColors.appThemeColor,
  indicatorColor: AppColors.appThemeColor,
  splashColor: AppColors.appThemeColor,
  textTheme: const TextTheme(
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.ligthGrey),
    titleMedium: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.blackText),
    headlineMedium: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackText),
    headlineLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.blackText),
    headlineSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.blackText),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grey),
    bodySmall: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blackText),
  ),
  textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.white, selectionColor: Colors.white),
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appThemeColor,
    titleTextStyle: TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(33),
        bottomRight: Radius.circular(33),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.whiteColor,
      textStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.appThemeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
      focusColor: AppColors.appThemeColor,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: AppColors.appThemeColor)),
      errorStyle: TextStyle(color: AppColors.errorColor),
      floatingLabelStyle: TextStyle(color: AppColors.appThemeColor),
      labelStyle: TextStyle(color: AppColors.ligthGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(color: AppColors.ligthGrey),
      ),
      errorMaxLines: 2,
      suffixIconColor: AppColors.ligthGrey,
      prefixIconColor: AppColors.ligthGrey),
);
