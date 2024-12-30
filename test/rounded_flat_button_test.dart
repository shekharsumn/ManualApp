import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';


void main() {
  group('RoundedFlatButton', () {
    testWidgets('renders with default properties', (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Default Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedFlatButton(
              text: buttonText,
              onClick: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);
      final button = tester.widget<MaterialButton>(find.byType(MaterialButton));
      expect(button.color, AppColors.darkRedColor); // Default background color
      expect(button.elevation, 0.0); // Default elevation
    });

    testWidgets('triggers onClick when pressed', (WidgetTester tester) async {
      // Arrange
      bool onPressedCalled = false;
      const buttonText = 'Pressable Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedFlatButton(
              text: buttonText,
              onClick: () {
                onPressedCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text(buttonText));
      await tester.pumpAndSettle();

      // Assert
      expect(onPressedCalled, isTrue);
    });

    testWidgets('does not trigger onClick when disabled', (WidgetTester tester) async {
      // Arrange
      bool onPressedCalled = false;
      const buttonText = 'Disabled Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedFlatButton(
              text: buttonText,
              onClick: () {
                onPressedCalled = true;
              },
              isDisabled: true,
            ),
          ),
        ),
      );

      await tester.tap(find.text(buttonText));
      await tester.pumpAndSettle();

      // Assert
      expect(onPressedCalled, isFalse);
    });

    testWidgets('applies custom background color and text color',
        (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Custom Button';
      const backgroundColor = Colors.green;
      const textColor = Colors.yellow;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedFlatButton(
              text: buttonText,
              onClick: () {},
              backgroundColor: backgroundColor,
              textColor: textColor,
            ),
          ),
        ),
      );

      // Assert
      final button = tester.widget<MaterialButton>(find.byType(MaterialButton));
      expect(button.color, backgroundColor);

      final textWidget = tester.widget<Text>(find.text(buttonText));
      expect(textWidget.style?.color, textColor);
    });

    testWidgets('renders in disabled state with correct styles',
        (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Disabled Button';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RoundedFlatButton(
              text: buttonText,
              onClick: () {},
              isDisabled: true,
            ),
          ),
        ),
      );

      // Assert
      final button = tester.widget<MaterialButton>(find.byType(MaterialButton));
      expect(button.color, AppColors.disbledBtnColor); // Disabled background color

      final textWidget = tester.widget<Text>(find.text(buttonText));
      expect(textWidget.style?.color, Colors.white); // Disabled text color
    });
  });
}