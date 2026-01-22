import 'package:flutter/material.dart';
import '../../core/constants.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryGreen, kPrimaryGreen.withOpacity(0.85)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: kPrimaryGreen.withOpacity(0.4), blurRadius: 15, offset: Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Wallet Balance', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Text('RWF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text('30990', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold)),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(child: _buildCardButton(Icons.arrow_downward_rounded, 'Withdraw')),
              SizedBox(width: 20),
              Expanded(child: _buildCardButton(Icons.sync_rounded, 'Convert')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardButton(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: kPrimaryGreen, size: 22),
          SizedBox(width: 10),
          Text(label, style: TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.w700, fontSize: 16)),
        ],
      ),
    );
  }
}
