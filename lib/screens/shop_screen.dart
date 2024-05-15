import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/product_service.dart';
import '../widgets/product_tile.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Shop',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductTile(product: product);
        },
      ),
    );
  }
}
