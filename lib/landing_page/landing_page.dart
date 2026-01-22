import 'dart:async';
import 'package:QuickFlick/landing_page/widgets/bottom_start_button.dart';
import 'package:QuickFlick/landing_page/widgets/dots_indicator.dart';
import 'package:QuickFlick/landing_page/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import '../homescreen/home_page.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "title": "Forget USSD Codes Forever",
      "desc": "Stop memorizing complex strings like *182*... Just tap to send money or pay bills instantly.",
      "icon": Icons.dialpad,
    },
    {
      "title": "100% Private & Local",
      "desc": "No backend, no cloud database. Your financial data is encrypted and stored only on your phone.",
      "icon": Icons.lock_outline,
    },
    {
      "title": "One-Click Data Top-up",
      "desc": "Refill your internet or airtime in a single click. No more dialing numbers manually.",
      "icon": Icons.touch_app,
    },
    {
      "title": "No More PIN Fatigue",
      "desc": "Secure your transactions without typing your PIN every single time. Fast, safe, and seamless.",
      "icon": Icons.fingerprint,
    },
  ];

  final Color primaryGreen = Color(0xFF4CAF50);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 4)
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _onboardingData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              flex: 5,
              child: OnboardingPageView(
                data: _onboardingData,
                pageController: _pageController,
                animation: _animation,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: DotsIndicator(
                currentIndex: _currentPage,
                itemCount: _onboardingData.length,
                activeColor: primaryGreen,
              ),
            ),
            BottomStartButton(
              color: primaryGreen,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
