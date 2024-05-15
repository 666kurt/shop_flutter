import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product_model.dart';
import 'package:flutter_shop/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import '../service/product_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text('Remove ${product.title} from cart?'),
        actions: [
          CupertinoButton(
            child: Text('Remove'),
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
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

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Connecting with payment system...'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final carts = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: carts.isEmpty
                ? Center(child: Text('Cart is empty'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      final item = carts[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text("\$${item.price}"),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => removeFromCart(context, item),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: CustomButton(
              icon: Text("PAY NOW"),
              onPressed: () => payButtonPressed(context),
            ),
          )
        ],
      ),
    );
  }
}
