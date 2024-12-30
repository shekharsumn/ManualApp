import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manual_app/model/questionnaire_model.dart';
import 'package:manual_app/service/questionnaire_service.dart';

final questionServiceProvider = Provider((ref) => QuestionService());

final questionViewModelProvider = FutureProvider<List<Question>>((ref) async {
  final service = ref.watch(questionServiceProvider);
  return service.fetchQuestions();
});