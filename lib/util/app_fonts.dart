import 'package:flutter/material.dart';
import 'package:manual_app/util/app_colors.dart';

/// A static class to manage font styles and families.
class AppFonts {
  // Font family name
  static const String ttNorms = 'TTNorms';

  // Regular text style
  static TextStyle regular(double fontSize,
      {Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle regularW400(double fontSize,
      {FontWeight fontweight = FontWeight.w400,
      Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontWeight: fontweight,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle regularW500(double fontSize,
      {FontWeight fontweight = FontWeight.w500,
      Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontWeight: fontweight,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  static TextStyle regularW800(double fontSize,
      {FontWeight fontweight = FontWeight.w800,
      Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontWeight: fontweight,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  // Bold text style
  static TextStyle bold(double fontSize,
      {Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  // Italic text style
  static TextStyle italic(double fontSize,
      {Color color = AppColors.secondaryColor}) {
    return TextStyle(
        fontFamily: ttNorms,
        fontStyle: FontStyle.italic,
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none);
  }

  // Underlined text style
  static TextStyle underline(double fontSize,
      {Color color = Colors.black, Color underlineColor = Colors.blue}) {
    return TextStyle(
      fontFamily: ttNorms,
      fontSize: fontSize,
      color: color,
      decoration: TextDecoration.underline,
      decorationColor: underlineColor,
    );
  }
}
