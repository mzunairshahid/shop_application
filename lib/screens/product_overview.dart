import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/cart.dart';
import 'package:resturant_application/screens/cart_screen.dart';
import 'package:resturant_application/widgets/app_drawer.dart';

import 'package:resturant_application/widgets/product_grid.dart';

enum FilterOption { favoritie, All }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption slectedValue) {
                setState(() {
                  if (slectedValue == FilterOption.favoritie) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Only Favorite '),
                      value: FilterOption.favoritie,
                    ),
                    const PopupMenuItem(
                      child: Text('Show all'),
                      value: FilterOption.All,
                    )
                  ]),
          Consumer<Cart>(
            builder: (_, cart, child) =>
                Badge(child: child, label: Text(cart.itemCount.toString())),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                  );
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: productsGrid(showFavs: _showFavoriteOnly),
    );
  }
}
