import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/orders.dart' show Orders;
import 'package:shopping/widgets/order_item.dart';
import 'package:shopping/widgets/side_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orers';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: const SideDrawer(),
      body: ListView.builder(
        itemBuilder: (_, index) => OrderItem(orders.orders[index]),
        itemCount: orders.orders.length,
      ),
    );
  }
}
