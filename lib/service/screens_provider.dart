import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/shop_screen.dart';

class ScreensProvider extends StatefulWidget {
  const ScreensProvider({super.key});

  @override
  State<ScreensProvider> createState() => _ScreensProviderState();
}

class _ScreensProviderState extends State<ScreensProvider> {
  int _selectedTab = 0;

  void changeTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _screenList = [
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        currentIndex: _selectedTab,
        onTap: changeTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
