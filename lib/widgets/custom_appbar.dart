import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/app_fonts.dart';

/// Enum representing the types of leading icons that can be displayed in the app bar.
enum LeadingBtnIcon {
  /// Represents a back button (arrow icon).
  backBtn,

  /// Represents a close button (close icon).
  closeBtn,

  /// Hide leading button
  noBtn
}

/// A customizable AppBar widget that adapts to various screen sizes and devices.
///
/// This widget provides an optional leading icon (either a back button or a close button),
/// a customizable background color, and a title.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Whether to show the leading icon in the app bar.
  final bool showLeadingIcon;

  /// The type of leading icon to display.
  final LeadingBtnIcon leadingBtnIcon;

  /// The background color of the app bar.
  final Color backgroundColor;

  /// The title to display in the app bar.
  final String title;

  /// A callback function that is executed when the leading icon is pressed.
  ///
  /// Defaults to popping the current navigation stack if not provided.
  final VoidCallback? onLeadingIconPressed;

  /// Tilte style for app bar text
  final TextStyle? titleStyle;

  const CustomAppBar({
    super.key,
    this.showLeadingIcon = false,
    this.leadingBtnIcon = LeadingBtnIcon.backBtn,
    this.backgroundColor = AppColors.backgroundLimeColor,
    this.title = '',
    this.onLeadingIconPressed,
    this.titleStyle = const TextStyle(
        fontFamily: AppFonts.ttNorms,
        fontWeight: FontWeight.bold,
        fontSize: 20),
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size and orientation for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen =
        screenWidth > 600; // Used for larger screens like tablets or foldables

    // Adjust the AppBar layout based on screen width
    return AppBar(
      backgroundColor: backgroundColor,
      leading: showLeadingIcon ? _buildLeadingIcon(context) : null,
      title: _buildTitle(context, isWideScreen),
      actions: [], // No actions on small screens
    );
  }

  // Title is adjusted for wide screens or tablets.
  Widget _buildTitle(BuildContext context, bool isWideScreen) {
    return isWideScreen
        ? Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow:
                      TextOverflow.ellipsis, // Adjust text for wide screens
                  style: titleStyle,
                ),
              ),
            ],
          )
        : Text(
            title,
            style: titleStyle,
          );
  }

  // Action button that appears on wide screens or foldables
  // Widget _buildActionButton(BuildContext context) {
  //   return IconButton(
  //     icon: const Icon(Icons.settings),
  //     onPressed: () {
  //       // Action logic here (e.g., open settings or another screen)
  //     },
  //   );
  // }

  /// Builds the leading icon widget based on the [leadingBtnIcon] type.
  Widget _buildLeadingIcon(BuildContext context) {
    final icon = leadingBtnIcon == LeadingBtnIcon.backBtn
        ? Icons.arrow_back
        : Icons.close;

    return leadingBtnIcon == LeadingBtnIcon.noBtn
        ? Container()
        : IconButton(
            icon: Icon(icon),
            onPressed: onLeadingIconPressed ?? () => context.maybePop(),
          );
  }

  /// Specifies the preferred size of the AppBar.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
