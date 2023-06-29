import 'package:flutter/cupertino.dart';

// To manage the state of the cart icon in homePage
// After you press add to basket
class CartProvider with ChangeNotifier {
  int _cartCount = 0;
  bool _isLiked = false;
  List<dynamic> basketItems = [];
  List<dynamic> likedItems = [];

  int get count => _cartCount;
  bool get isLiked => _isLiked;
  List<dynamic> get items => basketItems;
  List<dynamic> get liked => likedItems;

  void addToCart() {
    _cartCount++;
    notifyListeners();
  }

  void addToBasket(title, image, price) {
    items.add({"title": title, "image": image, "price": price});
    notifyListeners();
  }

  set isLiked(bool value) {
    _isLiked = value;
  }

  void removeFromBasket(index) {
    items.removeAt(index);
    _cartCount--;
    notifyListeners();
  }

  void addTolikedItems(title, image, price) {
    liked.add({"title": title, "image": image, "price": price});
    notifyListeners();
  }

  void removeFromLiked(index) {
    liked.removeAt(index);
    notifyListeners();
  }
}
