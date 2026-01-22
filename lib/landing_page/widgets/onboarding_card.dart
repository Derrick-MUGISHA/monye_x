import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final Animation<double> animation;

  const OnboardingCard({
    required this.data,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryGreen = Color(0xFF4CAF50);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -animation.value),
                child: child,
              );
            },
            child: Container(
              constraints: BoxConstraints(maxHeight: 350),
              width: double.infinity,
              alignment: Alignment.center,
              child: Icon(
                data['icon'],
                size: 300,
                color: primaryGreen,
              ),
            ),
          ),
          Spacer(),
          Text(
            data['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 16),
          Text(
            data['desc'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.grey[600],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
