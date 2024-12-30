import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/util/app_fonts.dart';
import 'package:manual_app/widgets/hyperlink_text.dart';

void main() {
  group('HyperlinkText', () {
    testWidgets('HyperlinkText displays text and handles onTap',
        (WidgetTester tester) async {
      const testText = 'Click here';
      const testTextColor = Colors.red;
      const testUnderlineColor = Colors.green;
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HyperlinkText(
              text: testText,
              textColor: testTextColor,
              underlineColor: testUnderlineColor,
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      // Verify the text is displayed
      expect(find.text(testText), findsOneWidget);

      // Verify the text style is correct
      final textWidget = tester.widget<Text>(find.text(testText));
      expect(
          textWidget.style,
          AppFonts.underline(16,
              color: testTextColor, underlineColor: testUnderlineColor));

      // Simulate a tap and verify the callback is invoked
      await tester.tap(find.text(testText));
      await tester.pump();
      expect(wasTapped, isTrue);
    });

    testWidgets('HyperlinkText displays text in all caps when allCaps is true',
        (WidgetTester tester) async {
      const testText = 'Click here';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HyperlinkText(
              text: testText,
              allCaps: true,
              onTap: () {},
            ),
          ),
        ),
      );

      // Verify the text is displayed in uppercase
      expect(find.text(testText.toUpperCase()), findsOneWidget);
      expect(find.text(testText), findsNothing);
    });

    testWidgets('HyperlinkText has no padding for hyperlink-like appearance',
        (WidgetTester tester) async {
      const testText = 'Click here';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HyperlinkText(
              text: testText,
              onTap: () {},
            ),
          ),
        ),
      );

      // Verify the TextButton has zero padding
      final textButton = tester.widget<TextButton>(find.byType(TextButton));
      final padding =
          textButton.style?.padding?.resolve(WidgetState.values.toSet());
      expect(padding, EdgeInsets.zero);
    });
  });
}
