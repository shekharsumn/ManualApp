import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/choice_content.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/string_const.dart';

void main() {
  group('ChoiceContent', () {
    testWidgets('ChoiceContent displays question, content, and button',
        (WidgetTester tester) async {
      // Define test inputs
      const testQuestion = 'Test Question';
      const testContentKey = Key('testContent');
      bool buttonPressed = false;

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceContent(
            question: testQuestion,
            content: Container(key: testContentKey),
            onNextPressed: () {
              buttonPressed = true;
            },
            isNextEnabled: true,
          ),
        ),
      );

      // Verify the question text is displayed
      expect(find.text(testQuestion), findsOneWidget);

      // Verify the content widget is displayed
      expect(find.byKey(testContentKey), findsOneWidget);

      // Verify the button is displayed
      expect(find.text(StringConstants.next.toUpperCase()), findsOneWidget);

      // Tap the button and verify it triggers the onNextPressed callback
      await tester.tap(find.text(StringConstants.next.toUpperCase()));
      await tester.pump();
      expect(buttonPressed, isTrue);
    });

    testWidgets('Next button is disabled when isNextEnabled is false',
        (WidgetTester tester) async {
      // Build the widget with isNextEnabled set to false
      await tester.pumpWidget(
        MaterialApp(
          home: ChoiceContent(
            question: 'Test Question',
            content: Container(),
            onNextPressed: () {},
            isNextEnabled: false,
          ),
        ),
      );

      // Verify the button is disabled
      final roundedFlatButton = tester.widget<RoundedFlatButton>(
        find.byType(RoundedFlatButton),
      );
      expect(roundedFlatButton.isDisabled, isTrue);
    });
  });
}
