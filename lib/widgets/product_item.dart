import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/cart.dart';
import 'package:shopping/providers/product.dart';
import 'package:shopping/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;
  // const ProductItem(
  //     {super.key,
  //     required this.id,
  //     required this.title,
  //     required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cartData = Provider.of<Cart>(context);
    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(product.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.ToggleFavouriteStatus();
                },
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  cartData.addItem(product.id, product.price, product.title);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Added Item to Cart',
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cartData.removeSingleItem(product.id);
                        }),
                  ));
                },
                color: Theme.of(context).accentColor,
              )),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Container(
                margin: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
