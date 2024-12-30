import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/app_router.gr.dart';
import 'package:manual_app/widgets/hyperlink_text.dart';
import 'package:manual_app/widgets/image_svg_widget.dart';
import 'package:manual_app/widgets/landing_subtitle.dart';
import 'package:manual_app/widgets/landing_title.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/string_const.dart';

/// Main Intro Screen
@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    debugPrint('Screen Height: $screenHeight');
    bool isSmallScreen = screenHeight < 860;

    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120),
              Center(
                child: SvgImageWidget(
                  assetPath: 'assets/images/manual_logo.svg',
                  width: 160,
                  height: 160,
                ),
              ),
              TitleSection(
                title1: StringConstants.landingTitle1,
                title2: StringConstants.landingTitle2,
              ),
              ReusableTextSection(
                subtitles: [
                  StringConstants.landingSubTitle1,
                  StringConstants.landingSubTitle2,
                  StringConstants.landingSubTitle3,
                ],
                subtitle: '',
              ),
              Padding(
                padding: EdgeInsets.only(top: isSmallScreen ? 50 : 70),
                child: HyperlinkText(
                  text: StringConstants.learnMore,
                  textColor: AppColors.secondaryColor,
                  underlineColor: AppColors.secondaryColor,
                  onTap: () {
                    context.router.push(LearnMoreRoute());
                  },
                ),
              ),
              const SizedBox(height: 14),
              RoundedFlatButton(
                text: StringConstants.takeTheQuiz,
                onClick: () {
                  context.router.push(DynamicQuizRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
