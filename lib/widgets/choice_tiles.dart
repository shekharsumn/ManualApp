import 'package:flutter/material.dart';

enum QuestionType { choiceTypeImage, choiceTypeText }

/// Reusable Option Tile
class ChoiceTile extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;
  final QuestionType questionType;
  final bool showBorder;

  const ChoiceTile({
    super.key,
    required this.child,
    required this.isSelected,
    required this.onTap,
    required this.questionType,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withAlpha(128) : Colors.transparent,
          borderRadius: BorderRadius.circular(
              questionType == QuestionType.choiceTypeImage ? 28.0 : 8.0),
          border: Border.all(
            color: isSelected
                ? Colors.green.withAlpha(128)
                : showBorder
                    ? Colors.grey
                    : Colors.transparent,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
