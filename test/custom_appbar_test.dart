import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/custom_appbar.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/app_fonts.dart';

void main() {
  group('CustomAppBar', () {
    testWidgets('CustomAppBar renders with title and default settings',
        (WidgetTester tester) async {
      const testTitle = 'Test AppBar';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: testTitle,
            ),
          ),
        ),
      );

      // Verify the title is displayed
      expect(find.text(testTitle), findsOneWidget);

      // Verify the background color is the default
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, AppColors.backgroundLimeColor);

      // Verify no leading icon is present
      expect(find.byType(IconButton), findsNothing);
    });

    testWidgets('CustomAppBar displays back button and triggers callback',
        (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppBar(
              showLeadingIcon: true,
              leadingBtnIcon: LeadingBtnIcon.backBtn,
              onLeadingIconPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      // Verify the back button icon is displayed
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // Tap the back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pump();

      // Verify the callback was triggered
      expect(wasPressed, isTrue);
    });

    testWidgets('CustomAppBar displays close button when configured',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              showLeadingIcon: true,
              leadingBtnIcon: LeadingBtnIcon.closeBtn,
            ),
          ),
        ),
      );

      // Verify the close button icon is displayed
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('CustomAppBar hides leading icon with LeadingBtnIcon.noBtn',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              showLeadingIcon: true,
              leadingBtnIcon: LeadingBtnIcon.noBtn,
            ),
          ),
        ),
      );

      // Verify no leading icon is displayed
      expect(find.byType(IconButton), findsNothing);
    });

    testWidgets('CustomAppBar applies custom title style',
        (WidgetTester tester) async {
      const customTitleStyle = TextStyle(
        fontFamily: AppFonts.ttNorms,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: 'Custom Style',
              titleStyle: customTitleStyle,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Custom Style'));
      expect(text.style, customTitleStyle);
    });
  });
}
