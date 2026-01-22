import 'package:flutter/material.dart';

import '../../core/constants.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final bool isExpense;

  const TransactionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isExpense ? Colors.red.withOpacity(0.1) : kPrimaryGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isExpense ? Colors.red : kPrimaryGreen, size: 22),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: kDarkText, fontWeight: FontWeight.w700, fontSize: 16)),
                SizedBox(height: 6),
                Text(date, style: TextStyle(color: kLightText, fontSize: 13)),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(color: isExpense ? Colors.red : kPrimaryGreen, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
