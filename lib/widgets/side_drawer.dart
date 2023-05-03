import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping/screens/orders_screen.dart';
import 'package:shopping/screens/user_products.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Welcome!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Orders'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Products'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(UserProducts.routeName);
            }),
          ),
        ],
      ),
    );
  }
}
