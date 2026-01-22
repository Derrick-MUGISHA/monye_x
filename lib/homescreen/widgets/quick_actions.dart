import 'package:flutter/material.dart';

import '../../core/constants.dart';

class QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick actions', style: TextStyle(color: kDarkText, fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(Icons.receipt_long_rounded, 'Pay'),
            _buildActionButton(Icons.phone_iphone_rounded, 'Airtime'),
            _buildActionButton(Icons.bolt_rounded, 'Electricity'),
            _buildActionButton(Icons.widgets_rounded, 'More'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 5))],
          ),
          child: Icon(icon, color: kAccentYellow, size: 28),
        ),
        SizedBox(height: 12),
        Text(label, style: TextStyle(color: kLightText, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
