import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/cart.dart';
import 'package:resturant_application/provider/orders.dart';
import 'package:resturant_application/provider/products_provider.dart';
import 'package:resturant_application/screens/cart_screen.dart';
import 'package:resturant_application/screens/order_screen.dart';
import 'package:resturant_application/screens/product_detail.dart';
import 'package:resturant_application/screens/product_overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
