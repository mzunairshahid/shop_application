import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/cart.dart';
import 'package:resturant_application/provider/product.dart';
import 'package:resturant_application/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;

  // const ProductItem(
  //     {super.key,
  //     required this.id,
  //     required this.title,
  //     required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, Product, _) => IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                icon: Icon(
                    product.isfavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.deepOrange)),
          ),
          trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);

                SnackBar(
                  content: Text('Add to Cart Item'),
                  duration: Duration(seconds: 3),
                );
              },
              icon: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.deepOrange,
              )),
        ),
      ),
    );
  }
}
