import 'package:flutter/material.dart';
import 'package:resturant_application/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'P1',
        title: 'Yellow Shirt',
        description: 'Its a flexible staf ',
        price: 50.19,
        imageURL:
            'https://www.kingsstudio.in/image/cache/catalog/2031/Yellow%203-600x800.jpg'),
    Product(
        id: 'P2',
        title: 'Green Shirt',
        description: ' Its for summer and winter season ',
        price: 50.19,
        imageURL:
            'https://ccstore.pk/cdn/shop/products/image_777d29eb-deb3-45ff-856b-81796872a2db@2x.jpg?v=1645302530'),
    Product(
        id: 'P3',
        title: 'Pink Shirt',
        description: 'Its for summer and winter season',
        price: 50.19,
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-QtqZZLQf__r4nFFkyWivBfFSjiTCxyQeYg&usqp=CAU'),
    Product(
        id: 'P4',
        title: 'Black Shirt',
        description: ' For a winter season',
        price: 50.19,
        imageURL:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0oUUFTmzEgRevO1OV7EXD0IbDcZQdT0eBig&usqp=CAU'),
  ];

  List<Product> get items {
    // if (_showFavoriteOnly) {
    //   return items.where((prodItem) => prodItem.isfavourite).toList();
    // }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItem {
    return _items.where((prodItem) => prodItem.isfavourite).toList();
  }

  // void showFavoriteOnly() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value)
    notifyListeners();
  }
}
