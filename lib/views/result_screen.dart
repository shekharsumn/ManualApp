import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/widgets/custom_appbar.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/app_fonts.dart';
import 'package:manual_app/util/string_const.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  final bool isRejected;

  const ResultScreen({
    super.key,
    required this.isRejected,
  });

  // Function to launch a URL
  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showLeadingIcon: true,
        leadingBtnIcon: LeadingBtnIcon.noBtn,
        title: StringConstants.quiz,
      ),
      body: Container(
        color: AppColors.backgroundLimeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Main content with result message
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: isRejected
                      ? Text(
                          StringConstants.quizRejectionMessage,
                          textAlign: TextAlign.start,
                          style: AppFonts.regularW800(28),
                        )
                      : RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: AppFonts.regularW800(28),
                            children: [
                              const TextSpan(
                                text:
                                    "Great news! We have the perfect treatment for your hair loss. Proceed to ",
                              ),
                              TextSpan(
                                text: "www.manual.co",
                                style: AppFonts.regularW800(28)
                                    .copyWith(color: AppColors.primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchUrl("https://www.manual.co");
                                  },
                              ),
                              const TextSpan(
                                text:
                                    ", and prepare to say hello to your new hair!",
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            // Bottom text button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedFlatButton(
                text: StringConstants.ok,
                backgroundColor: AppColors.secondaryColor,
                onClick: () => context.router.popUntilRoot(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
