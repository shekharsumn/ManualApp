import 'package:flutter/material.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/app_fonts.dart';
import 'package:manual_app/util/string_const.dart';

/// Reusable Content Wrapper
class ChoiceContent extends StatelessWidget {
  final String question;
  final Widget content;
  final VoidCallback onNextPressed;
  final bool isNextEnabled;

  const ChoiceContent({
    super.key,
    required this.question,
    required this.content,
    required this.onNextPressed,
    this.isNextEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLimeColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: AppFonts.bold(24),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(child: content),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedFlatButton(
                text: StringConstants.next.toUpperCase(),
                backgroundColor: AppColors.secondaryColor,
                isDisabled: !isNextEnabled,
                onClick: onNextPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}