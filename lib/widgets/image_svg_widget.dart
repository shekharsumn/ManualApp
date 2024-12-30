import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A stateless widget to display SVG images.
///
/// This widget provides options for specifying the SVG asset, width,
/// height, and optional color filters.
class SvgImageWidget extends StatelessWidget {
  /// The path to the SVG asset.
  final String assetPath;

  /// The width of the SVG image.
  final double? width;

  /// The height of the SVG image.
  final double? height;

  /// The color to tint the SVG image.
  final Color color;

  /// Creates an [SvgImageWidget].
  ///
  /// [assetPath] is required.
  const SvgImageWidget({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      colorFilter: ColorFilter.mode(color, BlendMode.overlay),
      fit: BoxFit.contain, // Adjusts how the SVG scales and fits
    );
  }
}
