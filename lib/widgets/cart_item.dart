import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final double quantity;
  final String title;

  const CartItem(this.id, this.price, this.quantity, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context).removeItem(id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(child: Text('\u{20B9}${price}')),
            title: Text(title),
            subtitle:
                Text('Total:\u{20B9}${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('${(quantity).toStringAsFixed(2)} X'),
          ),
        ),
      ),
    );
  }
}
