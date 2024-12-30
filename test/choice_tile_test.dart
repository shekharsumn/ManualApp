import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/choice_tiles.dart';

void main() {
  group('ChoiceTile', () {
    testWidgets('ChoiceTile displays child widget and responds to tap',
        (WidgetTester tester) async {
      // Define test inputs
      const testChildKey = Key('testChild');
      bool wasTapped = false;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceTile(
            isSelected: false,
            onTap: () {
              wasTapped = true;
            },
            questionType: QuestionType.choiceTypeText,
            child: Container(key: testChildKey),
          ),
        ),
      );

      // Verify the child widget is displayed
      expect(find.byKey(testChildKey), findsOneWidget);

      // Tap the widget and verify the callback is triggered
      await tester.tap(find.byKey(testChildKey));
      await tester.pump();
      expect(wasTapped, isTrue);
    });

    testWidgets('ChoiceTile shows green background when selected',
        (WidgetTester tester) async {
      // Build the widget with isSelected set to true
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceTile(
            isSelected: true,
            onTap: () {},
            questionType: QuestionType.choiceTypeText,
            child: const Text('Test'),
          ),
        ),
      );

      // Verify the background color is green
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ChoiceTile),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.green.withAlpha(128));
    });

    testWidgets('ChoiceTile uses appropriate border radius for question type',
        (WidgetTester tester) async {
      // Build the widget with choiceTypeImage
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceTile(
            isSelected: false,
            onTap: () {},
            questionType: QuestionType.choiceTypeImage,
            child: const Text('Image Type'),
          ),
        ),
      );

      // Verify the border radius is 28.0 for choiceTypeImage
      var container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ChoiceTile),
          matching: find.byType(Container),
        ),
      );
      var decoration = container.decoration as BoxDecoration;
      expect((decoration.borderRadius as BorderRadius).topLeft.x, 28.0);

      // Rebuild the widget with choiceTypeText
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceTile(
            isSelected: false,
            onTap: () {},
            questionType: QuestionType.choiceTypeText,
            child: const Text('Text Type'),
          ),
        ),
      );

      // Verify the border radius is 8.0 for choiceTypeText
      container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ChoiceTile),
          matching: find.byType(Container),
        ),
      );
      decoration = container.decoration as BoxDecoration;
      expect((decoration.borderRadius as BorderRadius).topLeft.x, 8.0);
    });

    testWidgets('ChoiceTile hides border when showBorder is false',
        (WidgetTester tester) async {
      // Build the widget with showBorder set to false
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceTile(
            isSelected: false,
            onTap: () {},
            questionType: QuestionType.choiceTypeText,
            showBorder: false,
            child: const Text('No Border'),
          ),
        ),
      );

      // Verify the border color is transparent
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ChoiceTile),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration;
      // Cast the border to Border and check its color
      final border = decoration.border as Border?;
      expect(border?.top.color, Colors.transparent);
    });
  });
}
