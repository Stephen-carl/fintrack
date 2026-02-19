import 'package:flutter/material.dart';
import 'package:youverify/core/pallette/app_pallette.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Capriola',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPallette.globalColor,
      primary: AppPallette.globalColor,
      secondary: AppPallette.secondaryColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Capriola',
        color: AppPallette.appBlack,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      hintStyle: TextStyle(fontSize: 16),
      hintMaxLines: 1,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(10),
      //   borderSide: BorderSide(color: Colors.grey),
      // ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPallette.globalColor),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),

      // for errors
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
