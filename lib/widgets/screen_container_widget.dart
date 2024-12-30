import 'package:flutter/material.dart';

/// Reusable Screen Container
class ReusableScreenContainer extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> children;

  const ReusableScreenContainer({
    super.key,
    required this.backgroundColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
