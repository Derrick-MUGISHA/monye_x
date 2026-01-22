import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'transaction_item.dart';

class TransactionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transactions', style: TextStyle(color: kDarkText, fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        SizedBox(height: 10),
        TransactionItem(
          icon: Icons.shopping_bag_outlined,
          title: 'School uniforms',
          date: '24 April 2025',
          amount: '- RWF 90,000',
          isExpense: true,
        ),
        TransactionItem(
          icon: Icons.arrow_upward_rounded,
          title: 'Salary Received',
          date: '23 April 2025',
          amount: '+ RWF 500,000',
          isExpense: false,
        ),
        TransactionItem(
          icon: Icons.coffee_rounded,
          title: 'Coffee Shop',
          date: '22 April 2025',
          amount: '- RWF 4,500',
          isExpense: true,
        ),
      ],
    );
  }
}
