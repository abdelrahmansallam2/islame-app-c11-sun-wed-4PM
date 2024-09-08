import 'package:flutter/material.dart';
import 'package:islame_app/app_colors.dart';

class MyThemData {
  static final ThemeData lightmode = ThemeData(
      canvasColor: AppColors.primarylightcolor,
      primaryColor: AppColors.primarylightcolor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'El Messiri',
              fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primarylightcolor,
          selectedItemColor: AppColors.blackcolor,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 30)),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
        color: AppColors.blackcolor,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        ),
        bodyMedium: TextStyle(
            color: AppColors.blackcolor,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'El Messiri'),
        bodySmall: TextStyle(
          color: AppColors.blackcolor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColors.primarylightcolor));
  static final ThemeData darkmode = ThemeData(
      canvasColor: AppColorsdark.bluecolor,
      primaryColor: AppColorsdark.primarydarkcolor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'El Messiri',
              fontSize: 30,
              fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColorsdark.bluecolor,
          selectedItemColor: AppColorsdark.primarydarkcolor,
          selectedIconTheme: IconThemeData(size: 35),
          unselectedIconTheme: IconThemeData(size: 30)),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColorsdark.whitecolor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        bodyMedium: TextStyle(
            color: AppColorsdark.whitecolor,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'El Messiri'),
        bodySmall: TextStyle(
          color: AppColorsdark.whitecolor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColorsdark.primarydarkcolor));
}
