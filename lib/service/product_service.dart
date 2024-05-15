import 'package:flutter/material.dart';
import '../models/product_model.dart';

class Shop extends ChangeNotifier {
  // locale database
  final List<Product> _shop = [
    Product(
      title: "Product 1",
      description: "Description 1",
      price: 10.99,
    ),
    Product(
      title: "Product 2",
      description: "Description 2",
      price: 10.99,
    ),
    Product(
      title: "Product 3",
      description: "Description 3",
      price: 10.99,
    ),
    Product(
      title: "Product 4",
      description: "Description 4",
      price: 10.99,
    ),
    Product(
      title: "Product 5",
      description: "Description 5",
      price: 10.99,
    ),
  ];

  // cart list
  List<Product> _cart = [];

  // getter for shop
  List<Product> get shop => _shop;

  // getter for cart
  List<Product> get cart => _cart;

  // add item
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
