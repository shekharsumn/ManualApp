import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/description_widget.dart';
import 'package:manual_app/util/app_fonts.dart';

void main() {
  testWidgets('ReusableDescription displays description text with correct style and padding', (WidgetTester tester) async {
    const testDescription = 'This is a sample description';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReusableDescription(description: testDescription),
        ),
      ),
    );

    // Verify the description text is displayed
    expect(find.text(testDescription), findsOneWidget);

    // Verify the Text widget has the correct style
    final textWidget = tester.widget<Text>(find.text(testDescription));
    expect(textWidget.style, AppFonts.regularW400(19));
    expect(textWidget.textAlign, TextAlign.start);

    // Verify the padding is applied correctly
    final paddingWidget = tester.widget<Padding>(
      find.ancestor(of: find.text(testDescription), matching: find.byType(Padding)),
    );
    expect(paddingWidget.padding, const EdgeInsets.symmetric(horizontal: 20.0));
  });
}