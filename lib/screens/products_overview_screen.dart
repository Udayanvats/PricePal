import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart.dart';

import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/widgets/badge.dart';

import 'package:shopping/widgets/products_grid.dart';
import 'package:shopping/widgets/side_drawer.dart';

// ignore: constant_identifier_names
enum FliterOption { Favourites, All }

class ProductsOverview extends StatefulWidget {
 const  ProductsOverview({super.key});

  @override
  State<ProductsOverview> createState() => _ProductsOverviewState();
}

class _ProductsOverviewState extends State<ProductsOverview> {
  var _showFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FliterOption selectedValue) {
              setState(() {
                if (selectedValue == FliterOption.Favourites) {
                  _showFavourites = true;
                } else {
                  _showFavourites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FliterOption.Favourites,
                child: Text('Only Favourites'),
              ),
             const PopupMenuItem(
                value: FliterOption.All,
                child: Text('ShowAll'),
              ),
            ],
          ),
          Consumer<Cart>(
            // ignore: avoid_types_as_parameter_names
            builder: (_, Cart, ch) => CustomBadge(
              // ignore: deprecated_member_use
              Theme.of(context).accentColor,
              value: Cart.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Productitem(
        showFavs: _showFavourites,
      ),
    );
  }
}
