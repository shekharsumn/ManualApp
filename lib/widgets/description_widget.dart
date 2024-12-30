import 'package:flutter/material.dart';
import 'package:manual_app/util/app_fonts.dart';

/// Reusable Description Widget
class ReusableDescription extends StatelessWidget {
  final String description;

  const ReusableDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        description,
        style: AppFonts.regularW400(19),
        textAlign: TextAlign.start,
      ),
    );
  }
}