import 'package:flutter/material.dart';
import 'package:manual_app/util/app_fonts.dart';
import 'package:manual_app/util/app_colors.dart';

/// Reusable Title and Subtitle Widget (handles both Title-Subtitle and Subtitle-only)
class ReusableTextSection extends StatelessWidget {
  final String? title;
  final String subtitle;
  final List<String>? subtitles; // Used only if multiple subtitles are provided

  const ReusableTextSection({
    super.key,
    this.title,
    required this.subtitle,
    this.subtitles, // Optional parameter to handle subtitle list
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    bool isSmallScreen = screenWidth < 820;
    if (subtitles != null) {
      // If a list of subtitles is provided, render as SubtitleSection
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: subtitles!
              .map(
                (sub) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    sub,
                    style: AppFonts.regularW400(isSmallScreen ? 17 : 19),
                  ),
                ),
              )
              .toList(),
        ),
      );
    } else {
      // If only a single subtitle is provided, render as Title + Subtitle
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) // Only show title if provided
              Text(
                title!,
                textAlign: TextAlign.start,
                style: AppFonts.bold(12, color: AppColors.titleColor),
              ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.start,
              style: AppFonts.bold(28),
            ),
          ],
        ),
      );
    }
  }
}
