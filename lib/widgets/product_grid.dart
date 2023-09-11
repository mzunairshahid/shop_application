import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/products_provider.dart';
import 'package:resturant_application/widgets/product_item.dart';

class productsGrid extends StatelessWidget {
  final bool showFavs;
  const productsGrid({
    super.key,
    required this.showFavs,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItem : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(
                // id: products[index].id,
                // title: products[index].title,
                // imageURL: products[index].imageURL
                ),
          )),
    );
  }
}
