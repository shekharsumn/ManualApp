import 'package:flutter/material.dart';
import 'package:manual_app/widgets/description_widget.dart';
import 'package:manual_app/widgets/image_widget.dart';
import 'package:manual_app/widgets/landing_subtitle.dart';
import 'package:manual_app/widgets/screen_container_widget.dart';
import 'package:manual_app/util/app_colors.dart';

/// Learn More Content Widget
class LearnMoreContent extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;

  const LearnMoreContent({
    super.key,
    required this.backgroundColor,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory LearnMoreContent.fromMap(Map<String, dynamic> data) {
    return LearnMoreContent(
      backgroundColor: AppColors.backgroundLimeColor,
      imagePath: data['assetID'] ?? '',
      title: data['header'] ?? '',
      subtitle: data['title'] ?? '',
      description: data['subtitle'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReusableScreenContainer(
      backgroundColor: backgroundColor,
      children: [
        ReusableImage(imageName: imagePath),
        const SizedBox(height: 40),
        ReusableTextSection(title: title, subtitle: subtitle),
        const SizedBox(height: 10),
        ReusableDescription(description: description),
      ],
    );
  }
}
