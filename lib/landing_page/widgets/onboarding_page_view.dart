import 'package:flutter/material.dart';

import 'onboarding_card.dart';

class OnboardingPageView extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final PageController pageController;
  final Animation<double> animation;
  final Function(int) onPageChanged;

  const OnboardingPageView({
    required this.data,
    required this.pageController,
    required this.animation,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return OnboardingCard(
          data: data[index],
          animation: animation,
        );
      },
    );
  }
}
