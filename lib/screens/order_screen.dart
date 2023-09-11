import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_application/provider/orders.dart';
import 'package:resturant_application/widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  get ord => null;

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => ord.OrderItem(orderData.orders[i]),
      ),
    );
  }
}
