import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double quantity;
  final double price;
  CartItem(this.id, this.title, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> items() {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exsistingCartItem) => CartItem(
              exsistingCartItem.id,
              exsistingCartItem.title,
              exsistingCartItem.quantity + 1,
              exsistingCartItem.price));
    } else {
      _items.putIfAbsent(productId,
          () => CartItem(DateTime.now().toString(), title, price, 1));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (exsistingCartItem) => CartItem(
              exsistingCartItem.id,
              exsistingCartItem.title,
              exsistingCartItem.quantity - 1,
              exsistingCartItem.price));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
