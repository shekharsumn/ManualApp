import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/model/questionnaire_model.dart';
import 'package:manual_app/widgets/choice_content.dart';
import 'package:manual_app/widgets/choice_tiles.dart';
import 'package:manual_app/util/app_fonts.dart';

/// ChoiceTypeTextScreen
@RoutePage()
class ChoiceTypeTextScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<int> onAnswerSelected;
  final VoidCallback onNextPressed;
  final int? selectedAnswer;

  const ChoiceTypeTextScreen({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    required this.onNextPressed,
    this.selectedAnswer,
  });

  @override
  ChoiceTypeTextScreenState createState() => ChoiceTypeTextScreenState();
}

class ChoiceTypeTextScreenState extends State<ChoiceTypeTextScreen> {
  void _onOptionSelected(int index) {
    widget.onAnswerSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceContent(
      question: widget.question.question,
      content: ListView.builder(
        itemCount: widget.question.options.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ChoiceTile(
              isSelected: widget.selectedAnswer == index,
              questionType: QuestionType.choiceTypeText,
              onTap: () => _onOptionSelected(index),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.question.options[index].display,
                  style: AppFonts.bold(18),
                ),
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
