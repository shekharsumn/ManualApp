import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/content_screen.dart';
import 'package:manual_app/widgets/description_widget.dart';
import 'package:manual_app/widgets/image_widget.dart';
import 'package:manual_app/widgets/landing_subtitle.dart';
import 'package:manual_app/widgets/screen_container_widget.dart';
import 'package:manual_app/util/app_colors.dart';

void main() {
  group('ContentScreen', () {
    testWidgets('LearnMoreContent displays all elements correctly',
        (WidgetTester tester) async {
      // Test data
      const backgroundColor = AppColors.backgroundLimeColor;
      const imagePath = 'hairLossInfoIllustration';
      const title = 'Sample Title';
      const subtitle = 'Sample Subtitle';
      const description = 'Sample description text.';

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LearnMoreContent(
              backgroundColor: backgroundColor,
              imagePath: imagePath,
              title: title,
              subtitle: subtitle,
              description: description,
            ),
          ),
        ),
      );

      // Verify the background color of the parent container
      final container = tester.widget<ReusableScreenContainer>(
        find.byType(ReusableScreenContainer),
      );
      expect(container.backgroundColor, backgroundColor);

      // Verify the image widget displays the correct image
      final imageWidget = tester.widget<ReusableImage>(
        find.byType(ReusableImage),
      );
      expect(imageWidget.imageName, imagePath);

      // Verify the title and subtitle are displayed
      final textSection = tester.widget<ReusableTextSection>(
        find.byType(ReusableTextSection),
      );
      expect(textSection.title, title);
      expect(textSection.subtitle, subtitle);

      // Verify the description is displayed
      final descriptionWidget = tester.widget<ReusableDescription>(
        find.byType(ReusableDescription),
      );
      expect(descriptionWidget.description, description);
    });

    testWidgets('LearnMoreContent.fromMap creates widget from map data',
        (WidgetTester tester) async {
      // Test data
      const testData = {
        'assetID': 'test',
        'header': 'Test Header',
        'title': 'Test Subtitle',
        'subtitle': 'Test Description',
      };

      // Create the widget using the factory constructor
      final widget = LearnMoreContent.fromMap(testData);

      // Verify the data is correctly mapped
      expect(widget.imagePath, testData['assetID']);
      expect(widget.title, testData['header']);
      expect(widget.subtitle, testData['title']);
      expect(widget.description, testData['subtitle']);
    });
  });
}
