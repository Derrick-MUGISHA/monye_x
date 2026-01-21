import 'dart:math';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int numberOfMoney = 20; // how many money icons falling
  final Random random = Random();

  List<double> xPositions = [];
  List<double> yPositions = [];
  List<double> speeds = [];

  @override
  void initState() {
    super.initState();
    // Initialize random positions
    for (int i = 0; i < numberOfMoney; i++) {
      xPositions.add(random.nextDouble());
      yPositions.add(random.nextDouble());
      speeds.add(0.002 + random.nextDouble() * 0.004);
    }

    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 10))
      ..addListener(() {
        setState(() {
          for (int i = 0; i < numberOfMoney; i++) {
            yPositions[i] += speeds[i];
            if (yPositions[i] > 1) yPositions[i] = -0.1; // reset top
          }
        });
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue sky background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Clouds at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white70, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Animated falling money
          ...List.generate(numberOfMoney, (index) {
            return Positioned(
              top: yPositions[index] * MediaQuery.of(context).size.height,
              left: xPositions[index] * MediaQuery.of(context).size.width,
              child: Icon(
                Icons.attach_money,
                color: Colors.greenAccent.shade400,
                size: 24 + random.nextDouble() * 10,
              ),
            );
          }),

          // App name or welcome text
          Center(
            child: Text(
              'Welcome to MoneyX',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 8,
                    color: Colors.black38,
                    offset: Offset(2, 2),
                  )
                ],
              ),
            ),
          ),

          // Start button at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
