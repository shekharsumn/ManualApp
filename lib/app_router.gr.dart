// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:manual_app/model/questionnaire_model.dart' as _i10;
import 'package:manual_app/widgets/choice_image_widget.dart' as _i1;
import 'package:manual_app/widgets/choice_text_widget.dart' as _i2;
import 'package:manual_app/views/landing_screen.dart' as _i4;
import 'package:manual_app/views/learn_more_screen.dart' as _i5;
import 'package:manual_app/views/quiz_screen.dart' as _i3;
import 'package:manual_app/views/result_screen.dart' as _i6;
import 'package:manual_app/views/splash_screen.dart' as _i7;

/// generated route for
/// [_i1.ChoiceTypeImageScreen]
class ChoiceTypeImageRoute extends _i8.PageRouteInfo<ChoiceTypeImageRouteArgs> {
  ChoiceTypeImageRoute({
    _i9.Key? key,
    required _i10.Question question,
    required _i9.ValueChanged<int> onAnswerSelected,
    required _i9.VoidCallback onNextPressed,
    int? selectedAnswer,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ChoiceTypeImageRoute.name,
          args: ChoiceTypeImageRouteArgs(
            key: key,
            question: question,
            onAnswerSelected: onAnswerSelected,
            onNextPressed: onNextPressed,
            selectedAnswer: selectedAnswer,
          ),
          initialChildren: children,
        );

  static const String name = 'ChoiceTypeImageRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChoiceTypeImageRouteArgs>();
      return _i1.ChoiceTypeImageScreen(
        key: args.key,
        question: args.question,
        onAnswerSelected: args.onAnswerSelected,
        onNextPressed: args.onNextPressed,
        selectedAnswer: args.selectedAnswer,
      );
    },
  );
}

class ChoiceTypeImageRouteArgs {
  const ChoiceTypeImageRouteArgs({
    this.key,
    required this.question,
    required this.onAnswerSelected,
    required this.onNextPressed,
    this.selectedAnswer,
  });

  final _i9.Key? key;

  final _i10.Question question;

  final _i9.ValueChanged<int> onAnswerSelected;

  final _i9.VoidCallback onNextPressed;

  final int? selectedAnswer;

  @override
  String toString() {
    return 'ChoiceTypeImageRouteArgs{key: $key, question: $question, onAnswerSelected: $onAnswerSelected, onNextPressed: $onNextPressed, selectedAnswer: $selectedAnswer}';
  }
}

/// generated route for
/// [_i2.ChoiceTypeTextScreen]
class ChoiceTypeTextRoute extends _i8.PageRouteInfo<ChoiceTypeTextRouteArgs> {
  ChoiceTypeTextRoute({
    _i9.Key? key,
    required _i10.Question question,
    required _i9.ValueChanged<int> onAnswerSelected,
    required _i9.VoidCallback onNextPressed,
    int? selectedAnswer,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ChoiceTypeTextRoute.name,
          args: ChoiceTypeTextRouteArgs(
            key: key,
            question: question,
            onAnswerSelected: onAnswerSelected,
            onNextPressed: onNextPressed,
            selectedAnswer: selectedAnswer,
          ),
          initialChildren: children,
        );

  static const String name = 'ChoiceTypeTextRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChoiceTypeTextRouteArgs>();
      return _i2.ChoiceTypeTextScreen(
        key: args.key,
        question: args.question,
        onAnswerSelected: args.onAnswerSelected,
        onNextPressed: args.onNextPressed,
        selectedAnswer: args.selectedAnswer,
      );
    },
  );
}

class ChoiceTypeTextRouteArgs {
  const ChoiceTypeTextRouteArgs({
    this.key,
    required this.question,
    required this.onAnswerSelected,
    required this.onNextPressed,
    this.selectedAnswer,
  });

  final _i9.Key? key;

  final _i10.Question question;

  final _i9.ValueChanged<int> onAnswerSelected;

  final _i9.VoidCallback onNextPressed;

  final int? selectedAnswer;

  @override
  String toString() {
    return 'ChoiceTypeTextRouteArgs{key: $key, question: $question, onAnswerSelected: $onAnswerSelected, onNextPressed: $onNextPressed, selectedAnswer: $selectedAnswer}';
  }
}

/// generated route for
/// [_i3.DynamicQuizScreen]
class DynamicQuizRoute extends _i8.PageRouteInfo<void> {
  const DynamicQuizRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DynamicQuizRoute.name,
          initialChildren: children,
        );

  static const String name = 'DynamicQuizRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.DynamicQuizScreen();
    },
  );
}

/// generated route for
/// [_i4.IntroScreen]
class IntroRoute extends _i8.PageRouteInfo<void> {
  const IntroRoute({List<_i8.PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.IntroScreen();
    },
  );
}

/// generated route for
/// [_i5.LearnMoreScreen]
class LearnMoreRoute extends _i8.PageRouteInfo<void> {
  const LearnMoreRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LearnMoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnMoreRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.LearnMoreScreen();
    },
  );
}

/// generated route for
/// [_i6.ResultScreen]
class ResultRoute extends _i8.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    _i9.Key? key,
    required bool isRejected,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            isRejected: isRejected,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResultRouteArgs>();
      return _i6.ResultScreen(
        key: args.key,
        isRejected: args.isRejected,
      );
    },
  );
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.isRejected,
  });

  final _i9.Key? key;

  final bool isRejected;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, isRejected: $isRejected}';
  }
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashScreen();
    },
  );
}
