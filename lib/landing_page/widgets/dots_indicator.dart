import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Color activeColor;

  const DotsIndicator({
    required this.currentIndex,
    required this.itemCount,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.only(right: 6),
          height: 6,
          width: currentIndex == index ? 24 : 6,
          decoration: BoxDecoration(
            color: currentIndex == index ? activeColor : Colors.grey[300],
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
