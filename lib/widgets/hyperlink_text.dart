import 'package:flutter/material.dart';
import 'package:manual_app/util/app_fonts.dart';

/// A customizable hyperlink text widget.
///
/// This widget displays text with an underline and allows you to specify
/// the text color, underline color, and an `onTap` function.
class HyperlinkText extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color underlineColor;
  final VoidCallback onTap;
  final bool allCaps;

  /// Creates a [HyperlinkText] widget.
  ///
  /// [text] and [onTap] are required.
  const HyperlinkText({
    super.key,
    required this.text,
    this.textColor = Colors.blue, // Default text color
    this.underlineColor = Colors.blue, // Default underline color
    required this.onTap,
    this.allCaps = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.zero, // Remove padding for hyperlink-like appearance
      ),
      child: Text(allCaps ? text.toUpperCase() : text,
          style: AppFonts.underline(16,
              color: textColor, underlineColor: underlineColor)),
    );
  }
}
