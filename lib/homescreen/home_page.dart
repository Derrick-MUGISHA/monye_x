import 'package:QuickFlick/homescreen/widgets/quickflick_home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    QuickFlickHomeScreen(),
    // PlaceholderPage(title: 'Send Money', icon: Icons.send_rounded),
    // PlaceholderPage(title: 'Transaction History', icon: Icons.history_rounded),
    // PlaceholderPage(title: 'Settings', icon: Icons.settings_rounded),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
