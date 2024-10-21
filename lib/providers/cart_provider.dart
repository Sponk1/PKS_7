import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String name, String price) {
    if (_items.containsKey(name)) {
      _items[name]!.quantity++;
    } else {
      _items[name] = CartItem(name: name, price: price);
    }
    notifyListeners();
  }

  void removeSingleItem(String name) {
    if (!_items.containsKey(name)) {
      return;
    }
    if (_items[name]!.quantity > 1) {
      _items[name]!.quantity--;
    } else {
      _items.remove(name);
    }
    notifyListeners();
  }

  void removeItem(String name) {
    _items.remove(name);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  double getTotalAmount() {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.getTotalPrice();
    });
    return total;
  }
}
