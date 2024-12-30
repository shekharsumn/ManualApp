import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manual_app/widgets/image_svg_widget.dart';

void main() {
  testWidgets('SvgImageWidget renders correctly with given parameters', (WidgetTester tester) async {
    // Define the test asset path
    const assetPath = 'assets/images/manual_logo.svg';

    // Test with only required parameters (assetPath)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SvgImageWidget(assetPath: assetPath),
        ),
      ),
    );

    // Verify that the SvgPicture.asset widget is rendered
    expect(find.byType(SvgPicture), findsOneWidget);

    // Test with custom width and height
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SvgImageWidget(
            assetPath: assetPath,
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );

    // Verify that the SvgPicture.asset widget is rendered with specific width and height
    final svgWidget = tester.widget<SvgPicture>(find.byType(SvgPicture));
    expect(svgWidget.width, 100.0);
    expect(svgWidget.height, 100.0);

    // Test with a color filter (tint color)
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SvgImageWidget(
            assetPath: assetPath,
            width: 100.0,
            height: 100.0,
            color: Colors.red,
          ),
        ),
      ),
    );

    // Verify that the color filter is applied correctly
    final svgWidgetWithColor = tester.widget<SvgPicture>(find.byType(SvgPicture));
    expect(svgWidgetWithColor.colorFilter, isNotNull); // Ensures the colorFilter is applied
  });
}