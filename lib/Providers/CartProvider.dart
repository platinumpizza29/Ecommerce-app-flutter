import 'package:flutter/cupertino.dart';

// To manage the state of the cart icon in homePage
// After you press add to basket
class CartProvider with ChangeNotifier {
  int _cartCount = 0;

  int get count => _cartCount;

  void addToCart() {
    _cartCount++;
    notifyListeners();
  }
}
