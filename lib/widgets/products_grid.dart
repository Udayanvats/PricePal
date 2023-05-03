import 'package:flutter/material.dart';
import 'package:shopping/providers/cart.dart';

import 'package:shopping/providers/products.dart';
import 'package:shopping/widgets/product_item.dart';
import 'package:provider/provider.dart';

class Productitem extends StatelessWidget {
  final bool showFavs;
  const Productitem({
    super.key,
    required this.showFavs,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
  
    final products =
        showFavs ? productsData.favouriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 10),
    );
  }
}
