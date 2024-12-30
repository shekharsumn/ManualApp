import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/horizontal_page_widget.dart';

void main() {
  group('HorizontalPageViewWithButton Tests', () {
    late List<Map<String, dynamic>> mockScreensData;

    setUp(() {
      mockScreensData = [
        {
          "assetID": "image1",
          "header": "Header 1",
          "title": "Title 1",
          "subtitle": "Subtitle 1",
        },
        {
          "assetID": "image2",
          "header": "Header 2",
          "title": "Title 2",
          "subtitle": "Subtitle 2",
        },
        {
          "assetID": "image3",
          "header": "Header 3",
          "title": "Title 3",
          "subtitle": "Subtitle 3",
        },
      ];
    });

    Widget buildTestableWidget() {
      return MaterialApp(
        home: HorizontalPageViewWithButton(
          screensData: mockScreensData,
          buildContent: (data) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['header'], key: Key('header_${data['assetID']}')),
                Text(data['title'], key: Key('title_${data['assetID']}')),
                Text(data['subtitle'], key: Key('subtitle_${data['assetID']}')),
              ],
            ),
          ),
        ),
      );
    }

    testWidgets('Displays initial screen correctly', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      // Verify the first screen is shown
      expect(find.text('Header 1'), findsOneWidget);
      expect(find.text('Title 1'), findsOneWidget);
      expect(find.text('Subtitle 1'), findsOneWidget);

      // Verify other screens are not shown
      expect(find.text('Header 2'), findsNothing);
      expect(find.text('Header 3'), findsNothing);
    });

    testWidgets('Page indicator updates when navigating between pages',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      // Verify the initial page indicator is selected
      expect(find.byType(Container).at(0), findsOneWidget);

      // Navigate to the next page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      // Verify the second screen is shown
      expect(find.text('Header 2'), findsOneWidget);
      expect(find.text('Title 2'), findsOneWidget);

      // Verify the page indicator updates
      expect(
        find.descendant(
          of: find.byType(Row),
          matching: find.byType(Container),
        ),
        findsWidgets,
      );
    });

    testWidgets('Next button navigates to the next screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());

      // Verify the initial page
      expect(find.text('Header 1'), findsOneWidget);

      // Tap the Next button
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Verify the second page is now displayed
      expect(find.text('Header 2'), findsOneWidget);

      // Tap the Next button again
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Verify the third page is now displayed
      expect(find.text('Header 3'), findsOneWidget);
    });
  });
}