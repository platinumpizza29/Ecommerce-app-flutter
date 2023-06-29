import 'package:flutter/cupertino.dart';

// To manage the state of the cart icon in homePage
// After you press add to basket
class CartProvider with ChangeNotifier {
  int _cartCount = 0;
  List<dynamic> basketItems = [];
  List<dynamic> likedItems = [];

  int get count => _cartCount;
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

  void removeFromBasket(index) {
    items.removeAt(index);
    notifyListeners();
  }

  void addTolikedItems(title, image, price, isLiked) {
    if (isLiked == true) {
      liked.add({"title": title, "image": image, "price": price});
      notifyListeners();
    } else {
      liked.removeWhere((element) => element == title);
      notifyListeners();
    }
  }
}
