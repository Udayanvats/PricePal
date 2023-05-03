import 'package:flutter/material.dart';
import 'package:shopping/providers/cart.dart';
import 'package:shopping/providers/orders.dart';
import 'package:shopping/providers/products.dart';
import 'package:shopping/screens/cart_screen.dart';
import 'package:shopping/screens/edit_product.dart';
import 'package:shopping/screens/orders_screen.dart';
import 'package:shopping/screens/product_detail_screen.dart';
import 'package:shopping/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/user_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Application',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverview(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          UserProducts.routeName: (ctx) => const UserProducts(),
          EditProductScreen.routeName:(ctx)=>const EditProductScreen(),
        },
      ),
    );
  }
}
