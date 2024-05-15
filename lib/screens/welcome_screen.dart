import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 68,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 25),
            Text(
              'MINIMAL SHOP',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Made with Flutter ♡',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            CustomButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/screens_provider');
              },
            ),
          ],
        ),
      ),
    );
  }
}
