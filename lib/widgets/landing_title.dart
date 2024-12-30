import 'package:flutter/material.dart';
import 'package:manual_app/util/app_fonts.dart';

/// Reusable Component for Title Text
class TitleSection extends StatelessWidget {
  final String title1;
  final String title2;

  const TitleSection({
    required this.title1,
    required this.title2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    bool isSmallScreen = screenWidth < 820;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title1,
            style: AppFonts.bold(isSmallScreen ? 60 : 70),
          ),
          Text(
            title2,
            style: AppFonts.bold(isSmallScreen ? 60 : 70),
          ),
        ],
      ),
    );
  }
}
