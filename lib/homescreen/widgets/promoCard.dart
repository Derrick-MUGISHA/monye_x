import 'package:flutter/material.dart';

import '../../core/constants.dart';

class PromoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPrimaryGreen.withOpacity(0.1), // Light green background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kPrimaryGreen.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kPrimaryGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.family_restroom_rounded, color: Colors.white, size: 30),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Family Wallet Added',
                  style: TextStyle(
                    color: kDarkText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Set Spending Limits With Linked Family Accounts.',
                  style: TextStyle(
                    color: kLightText,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
