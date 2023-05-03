import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopping/providers/products.dart';
import 'package:shopping/screens/edit_product.dart';
import 'package:shopping/widgets/side_drawer.dart';
import 'package:shopping/widgets/user_product_item.dart';

class UserProducts extends StatelessWidget {
  const UserProducts({super.key});
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, i) => Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    UserProductItem(
                      imageUrl: productData.items[i].imageUrl,
                      title: productData.items[i].title,
                    ),
                  ],
                )),
      ),
      drawer: const SideDrawer(),
    );
  }
}
