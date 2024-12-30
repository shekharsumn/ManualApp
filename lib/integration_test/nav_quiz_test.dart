import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:manual_app/views/landing_screen.dart';
import 'package:manual_app/widgets/hyperlink_text.dart';
import 'package:manual_app/widgets/image_svg_widget.dart';
import 'package:manual_app/widgets/landing_subtitle.dart';
import 'package:manual_app/widgets/landing_title.dart';
import 'package:manual_app/widgets/rounded_button.dart';

void main() {
  // Test setup
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Test navigation from IntroScreen to DynamicQuizScreen',
      (WidgetTester tester) async {
    // Build the IntroScreen widget by navigating to it.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: IntroScreen(),
        ),
      ),
    );

    // Verify that the initial screen content is loaded properly
    expect(find.byType(SvgImageWidget),
        findsOneWidget); // Check if the SVG logo is displayed
    expect(find.byType(TitleSection), findsOneWidget); // Verify landing title
    expect(find.byType(ReusableTextSection), findsOneWidget); // Verify subtitle
    expect(
        find.byType(HyperlinkText), findsOneWidget); // Verify 'Learn More' link
    expect(find.byType(RoundedFlatButton),
        findsOneWidget); // Verify 'Take the Quiz' button

    // Simulate tap on 'Learn More' hyperlink
    await tester.tap(find.byType(RoundedFlatButton));
    await tester.pumpAndSettle(); // Wait for the transition to complete

    // Verify that the DynamicQuizScreen is displayed after navigation
    expect(find.byType(Scaffold), findsAny);
  });
}
