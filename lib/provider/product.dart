import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  bool isfavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageURL,
    this.isfavourite = false,
  });
  void toggleFavoriteStatus() {
    isfavourite = !isfavourite;
    notifyListeners();
  }
}
