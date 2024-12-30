import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manual_app/app_router.gr.dart';
import 'package:manual_app/widgets/custom_appbar.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/string_const.dart';
import 'package:manual_app/viewModel/questionnaire_viewmodel.dart';
import 'package:manual_app/widgets/choice_image_widget.dart';
import 'package:manual_app/widgets/choice_text_widget.dart';

@RoutePage()
class DynamicQuizScreen extends ConsumerStatefulWidget {
  const DynamicQuizScreen({super.key});

  @override
  DynamicQuizScreenState createState() => DynamicQuizScreenState();
}

class DynamicQuizScreenState extends ConsumerState<DynamicQuizScreen> {
  int currentQuestionIndex = 0;
  List<bool> answers = List.empty(growable: true);

  // List to store selected answers
  List<dynamic> selectedAnswers = [];

  void _nextQuestion(dynamic answer) {
    setState(() {
      // Store the answer for the current question
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  void _previousQuestion() {
    setState(() {
      // Move to the previous question if not the first question
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      } else {
        context.maybePop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionAsyncValue = ref.watch(questionViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        showLeadingIcon: true,
        leadingBtnIcon: LeadingBtnIcon.backBtn,
        onLeadingIconPressed: _previousQuestion,
        title: StringConstants.quiz,
      ),
      body: questionAsyncValue.when(
        data: (questions) {
          if (currentQuestionIndex == questions.length) {
            return Center(
              child: Text(
                "You have completed the quiz.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          final currentQuestion = questions[currentQuestionIndex];
          // Initialize the selectedAnswers list with nulls if not already initialized
          if (selectedAnswers.isEmpty) {
            selectedAnswers = List.filled(questions.length, null);
          }

          return Container(
            color: AppColors.backgroundLimeColor,
            child: Center(
              child: Builder(
                builder: (context) {
                  switch (currentQuestion.type) {
                    case "ChoiceTypeImage":
                      return ChoiceTypeImageScreen(
                        question: currentQuestion,
                        onAnswerSelected: (index) => _nextQuestion(index),
                        selectedAnswer: selectedAnswers[currentQuestionIndex],
                        onNextPressed: () {
                          answers.add(currentQuestion
                              .options[selectedAnswers[currentQuestionIndex]]
                              .isRejection);

                          /// Move to the next question
                          setState(() {
                            if (currentQuestionIndex <= questions.length - 1) {
                              currentQuestionIndex++;
                            }
                            if (currentQuestionIndex == questions.length) {
                              /// show result
                              checkFinalResult();
                            }
                          });
                        },
                      );
                    case "ChoiceTypeText":
                      return ChoiceTypeTextScreen(
                        question: currentQuestion,
                        onAnswerSelected: (indexes) => _nextQuestion(indexes),
                        selectedAnswer: selectedAnswers[currentQuestionIndex],
                        onNextPressed: () {
                          answers.add(currentQuestion
                              .options[selectedAnswers[currentQuestionIndex]]
                              .isRejection);

                          /// Move to the next question
                          setState(() {
                            if (currentQuestionIndex <= questions.length - 1) {
                              currentQuestionIndex++;
                            }

                            if (currentQuestionIndex == questions.length) {
                              /// show result
                              checkFinalResult();
                            }
                          });
                        },
                      );

                    /// error handling for unsupported question type
                    default:
                      return _unsupportedQuestionType(context);
                  }
                },
              ),
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load questions: $error'),
        ),
      ),
    );
  }

  Widget _unsupportedQuestionType(BuildContext context) {
    return Container(
      color: AppColors.backgroundLimeColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Ensures the content takes minimal vertical space
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically
          children: [
            Text(
              'Unsupported Question Type',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black), // Customize style as needed
            ),
            const SizedBox(height: 60),
            RoundedFlatButton(
              text: 'Close',
              onClick: () {
                context.router.popUntilRoot();
              },
            ),
          ],
        ),
      ),
    );
  }

  void checkFinalResult() {
    bool isSuccess = answers.every((answer) => answer == false);
    _showQuestionnaireResult(context, !isSuccess);
  }

  void _showQuestionnaireResult(BuildContext context, bool isRejected) {
    answers.clear();
    context.router.push(
      ResultRoute(isRejected: isRejected),
    );
  }
}
