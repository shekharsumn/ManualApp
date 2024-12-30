import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/util/app_colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: AppColors.backgroundLimeColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset('assets/images/hairLossInfoIllustration.png'),
        ),
      ),
    ));
  }
}
