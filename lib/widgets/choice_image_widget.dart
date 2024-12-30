import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/model/questionnaire_model.dart';
import 'package:manual_app/widgets/choice_content.dart';
import 'package:manual_app/widgets/choice_tiles.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// ChoiceTypeImageScreen
@RoutePage()
class ChoiceTypeImageScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<int> onAnswerSelected;
  final VoidCallback onNextPressed;
  final int? selectedAnswer;

  const ChoiceTypeImageScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    required this.onNextPressed,
    this.selectedAnswer,
  });

  @override
  ChoiceTypeImageScreenState createState() => ChoiceTypeImageScreenState();
}

class ChoiceTypeImageScreenState extends State<ChoiceTypeImageScreen> {
  void _onOptionSelected(int index) {
    widget.onAnswerSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceContent(
      question: widget.question.question,
      content: GridView.builder(
        itemCount: widget.question.options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return ChoiceTile(
            isSelected: widget.selectedAnswer == index,
            onTap: () => _onOptionSelected(index),
            showBorder: false,
            questionType: QuestionType.choiceTypeImage,
            child: CachedNetworkImage(
              imageUrl: widget.question.options[index].display,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
      onNextPressed: widget.onNextPressed,
      isNextEnabled: widget.selectedAnswer != null,
    );
  }
}