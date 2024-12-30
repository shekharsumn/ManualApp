import 'package:flutter/material.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/app_fonts.dart';

/// A customizable rounded corner button with a disabled state.
///
/// This button allows you to specify the elevation, background color,
/// text color, and an onClick callback. It also supports a disabled state.
class RoundedFlatButton extends StatelessWidget {
  final double elevation;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onClick;
  final double minWidth;
  final double minHeight;
  final bool isDisabled;

  /// Creates a [RoundedFlatButton].
  ///
  /// [text] is required. If [isDisabled] is true, [onClick] will be ignored.
  const RoundedFlatButton({
    super.key,
    this.elevation = 0.0, // Default elevation
    this.backgroundColor = AppColors.darkRedColor, // Default background color
    this.textColor = Colors.white, // Default text color
    this.minWidth = 366.0,
    this.minHeight = 60.0,
    required this.text, // Button text
    this.onClick, // OnClick callback
    this.isDisabled = false, // Default is not disabled
  });

  @override
  Widget build(BuildContext context) {
    // Determine the effective background and text colors based on the disabled state
    final effectiveBackgroundColor =
        isDisabled ? AppColors.disbledBtnColor : backgroundColor;
    final effectiveTextColor = textColor;

    return MaterialButton(
      elevation: elevation,
      color: effectiveBackgroundColor,
      textColor: effectiveTextColor,
      minWidth: minWidth,
      height: minHeight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0), // Rounded corners
      ),
      onPressed:
          isDisabled ? (){} : onClick, // Disable button if isDisabled is true
      child: Text(
        text,
        style: AppFonts.bold(
          16,
          color: effectiveTextColor,
        ),
      ),
    );
  }
}
