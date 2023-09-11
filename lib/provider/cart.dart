import 'package:flutter/material.dart';

class cartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  cartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, cartItem> _items = {};

  Map<String, cartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exitingCardItem) => cartItem(
              id: exitingCardItem.id,
              title: exitingCardItem.title,
              quantity: exitingCardItem.quantity + 1,
              price: exitingCardItem.price));
    } else {
      _items[productId] = cartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: 1,
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
