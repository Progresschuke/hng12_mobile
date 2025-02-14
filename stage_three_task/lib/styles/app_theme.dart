import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stage_three_task/styles/app_colors.dart';

class Styles {
  static ThemeData appThemeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? AppColors.darkBg : AppColors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDarkTheme ? AppColors.gray200 : AppColors.gray900,
        ),
        titleTextStyle: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? AppColors.gray200 : AppColors.black,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      iconTheme: IconThemeData(
          color: isDarkTheme ? AppColors.gray200 : AppColors.gray900),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.agbalumo().copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: isDarkTheme ? AppColors.gray200 : AppColors.darkBlue,
        ),
        bodySmall: GoogleFonts.poppins().copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: isDarkTheme ? AppColors.gray300 : AppColors.black,
        ),
        bodyLarge: GoogleFonts.poppins().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: isDarkTheme ? AppColors.gray200 : AppColors.black,
        ),
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: isDarkTheme ? AppColors.darkBg : AppColors.white,
    );
  }
}
