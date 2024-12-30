class Questionnaire {
  final List<Question> questions;

  Questionnaire({required this.questions});

  /// Factory constructor to create a `Questionnaire` instance from JSON.
  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    var questionsList = json['questions'] as List;
    return Questionnaire(
      questions: questionsList.map((q) => Question.fromJson(q)).toList(),
    );
  }

  /// Converts the `Questionnaire` instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}

class Question {
  final String question;
  final String type;
  final List<Option> options;

  Question({
    required this.question,
    required this.type,
    required this.options,
  });

  /// Factory constructor to create a `Question` instance from JSON.
  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = json['options'] as List;
    return Question(
      question: json['question'],
      type: json['type'],
      options: optionsList.map((o) => Option.fromJson(o)).toList(),
    );
  }

  /// Converts the `Question` instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'type': type,
      'options': options.map((o) => o.toJson()).toList(),
    };
  }
}

class Option {
  final String display;
  final dynamic value; // Can be String or bool
  final bool isRejection;

  Option({
    required this.display,
    required this.value,
    required this.isRejection,
  });

  /// Factory constructor to create an `Option` instance from JSON.
  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      display: json['display'],
      value: json['value'],
      isRejection: json['isRejection'],
    );
  }

  /// Converts the `Option` instance to JSON.
  Map<String, dynamic> toJson() {
    return {
      'display': display,
      'value': value,
      'isRejection': isRejection,
    };
  }
}