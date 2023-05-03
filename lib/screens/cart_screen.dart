import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart.dart' show Cart;
import 'package:shopping/providers/orders.dart';
import 'package:shopping/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    final cartItems = cart.items();
    final cartItemList = cartItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        '\u{20B9}${(cart.totalAmount).toStringAsFixed(2)}',
                        style:const  TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                        onPressed: () {
                          Provider.of<Orders>(context, listen: false)
                              .addOrder(cartItemList, cart.totalAmount);
                          cart.clear();
                        },
                        child: const Text('ORDER NOW'))
                  ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (ctx, i) => CartItem(
              cartItemList[i].id,
              cartItemList[i].price,
              cartItemList[i].quantity,
              cartItemList[i].title,
            ),
          ))
        ],
      ),
    );
  }
}
