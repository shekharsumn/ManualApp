import 'package:flutter/material.dart';

/// Reusable Image Widget
class ReusableImage extends StatelessWidget {
  final String imageName;

  const ReusableImage({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Image.asset('assets/images/$imageName.png'),
    );
  }
}