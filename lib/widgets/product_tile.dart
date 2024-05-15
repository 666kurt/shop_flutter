import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../service/product_service.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text('Add this item to cart?'),
        actions: [
          CupertinoButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
          ),
          CupertinoButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              child: Image.asset(product.imagePath),
              padding: EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(
            product.title.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price.toString()}"),
              CustomButton(
                icon: Icon(Icons.add),
                onPressed: () => addToCart(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
