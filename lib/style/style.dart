import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_hub/style/screen_utils.dart';

class AppColors {
  /// Common
  final Color primaryColour = Color(0xFF34495E);
  final Color secondaryColour = Color(0xFF98AEC6);
  final Color accentColour = Color(0xFFC0C0C0);
  final Color backgroundColour = const Color(0xFFFFFFE4);
  final Color textColour = const Color(0xFF212121);
}

class AppTextStyles {
  static TextStyle headline1(
      BuildContext context, double? customFontSize, Color? customColour) {
    // if custom font there then use nahi toh default
    final screenUtil = ScreenUtils(context);
    double fontSize = customFontSize ?? screenUtil.responsiveFontSize(0.10);
    Color color = customColour ?? AppColors().textColour;
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle headline2(
      BuildContext context, double? customFontSize, Color? customColour) {
    // if custom font there then use nahi toh default
    final screenUtil = ScreenUtils(context);
    double fontSize = customFontSize ?? screenUtil.responsiveFontSize(0.10);
    Color color = customColour ?? AppColors().textColour;
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      // fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    final screenUtil = ScreenUtils(context);
    return GoogleFonts.montserrat(
      fontSize: screenUtil.responsiveFontSize(0.05), // 8% of screen width
      fontWeight: FontWeight.bold,
      color: AppColors().textColour,
    );
  }
}
