import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manual_app/widgets/custom_appbar.dart';
import 'package:manual_app/widgets/rounded_button.dart';
import 'package:manual_app/util/app_colors.dart';
import 'package:manual_app/util/string_const.dart';

class HorizontalPageViewWithButton extends StatefulWidget {
  final List<dynamic> screensData;
  final Widget Function(Map<String, dynamic> data) buildContent;

  const HorizontalPageViewWithButton({
    super.key,
    required this.screensData,
    required this.buildContent,
  });

  @override
  State<HorizontalPageViewWithButton> createState() =>
      _HorizontalPageViewWithButtonState();
}

class _HorizontalPageViewWithButtonState
    extends State<HorizontalPageViewWithButton> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextButtonPressed() {
    if (_currentPageIndex < widget.screensData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle the "Done" action, e.g., navigate or pop
      AutoRouter.of(context).maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showLeadingIcon: true,
        leadingBtnIcon: LeadingBtnIcon.closeBtn,
        backgroundColor: AppColors.backgroundLimeColor,
        title: StringConstants.whatCanWeHelp,
      ),
      body: Container(
        color: AppColors.backgroundLimeColor,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.screensData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = widget.screensData[index];
                  return widget.buildContent(item);
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildPageIndicator(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedFlatButton(
                backgroundColor: AppColors.secondaryColor,
                onClick: _onNextButtonPressed,
                text: _currentPageIndex != widget.screensData.length - 1
                    ? 'Next'
                    : 'Done',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.screensData.length, (index) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPageIndex == index
                ? AppColors.secondaryColor
                : Colors.grey.shade300,
          ),
        );
      }),
    );
  }
}