import 'dart:convert';

import 'package:manual_app/jsonData/app_json_data.dart';
import 'package:manual_app/model/questionnaire_model.dart';

class QuestionService {
  // Simulated JSON data
  Future<List<Question>> fetchQuestions() async {
    const jsonData = AppJsonData.questionanaireJson;
    final data = jsonDecode(jsonData) as Map<String, dynamic>;
    final questionsList = data['questions'] as List;

    return questionsList.map((json) => Question.fromJson(json)).toList();
  }
}