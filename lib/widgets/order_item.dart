import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shopping/providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  const OrderItem(
    this.order, {
    super.key,
  });
  final ord.OrderItem order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          ListTile(
            title: Text('₹${widget.order.amount}'),
            subtitle: Text(DateFormat('dd-MM-yyyy').format(widget.order.time)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = true;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: min(widget.order.products.length * 20.0 + 40, 180),
              child: ListView(
                children: widget.order.products.map((prod) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prod.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${prod.quantity}x ₹${prod.price}',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  );
                }).toList(),
              ),
            )
        ]));
  }
}
