import 'package:flutter/material.dart';
import 'package:flutter_shop/service/screens_provider.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'service/product_service.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
  );
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routes: {
        '/': (context) => WelcomeScreen(),
        '/screens_provider': (context) => ScreensProvider(),
      },
    );
  }
}
