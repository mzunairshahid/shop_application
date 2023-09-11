import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // const ProductDetailScreen({super.key, required this.title});
  static const routeName = '/Product-Detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              loadedProduct.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$${loadedProduct.price}',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            loadedProduct.description,
            textAlign: TextAlign.center,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
