import 'package:QuickFlick/homescreen/widgets/promoCard.dart';
import 'package:QuickFlick/homescreen/widgets/quick_actions.dart';
import 'package:QuickFlick/homescreen/widgets/transactionSection.dart';
import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'balance_card.dart';

class QuickFlickHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 25),
            BalanceCard(),
            SizedBox(height: 25),
            QuickActions(),
            SizedBox(height: 25),
            PromoCard(),
            SizedBox(height: 25),
            TransactionsSection(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Welcome back!', style: TextStyle(color: kDarkText, fontSize: 24, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.notifications_none_rounded, color: kDarkText),
            ),
            SizedBox(width: 15),
            CircleAvatar(
              backgroundColor: kAccentYellow,
              radius: 22,
              child: Text('KH', style: TextStyle(color: kDarkText, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}
