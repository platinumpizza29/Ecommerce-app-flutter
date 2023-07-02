import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// To manage the state of the cart icon in homePage
// After you press add to basket
class CartProvider with ChangeNotifier {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

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
    collectionRef.doc(currentUser!.uid).update({
      'myCart': FieldValue.arrayUnion([
        {"title": title, "image": image, "price": price}
      ]),
    });

    items.add({"title": title, "image": image, "price": price});
    notifyListeners();
  }

  void removeFromBasket(index) async {
    final DocumentSnapshot documentSnapshot =
        await collectionRef.doc(currentUser!.uid).get();
    final List<Map<String, dynamic>> listOfMaps =
        List<Map<String, dynamic>>.from(documentSnapshot['myCart']);
    final int indexToRemove = index; // Replace with your desired index
    listOfMaps.removeAt(indexToRemove);
    await collectionRef.doc(currentUser!.uid).update({
      'myCart': listOfMaps,
    });

    items.removeAt(index);
    _cartCount--;
    notifyListeners();
  }

  //liked

  set isLiked(bool value) {
    _isLiked = value;
  }

  void addTolikedItems(title, image, price) {
    collectionRef.doc(currentUser!.uid).update({
      'liked': FieldValue.arrayUnion([
        {"title": title, "image": image, "price": price}
      ]),
    });
    liked.add({"title": title, "image": image, "price": price});
    notifyListeners();
  }

  void removeFromLiked(index) async {
    final DocumentSnapshot documentSnapshot =
        await collectionRef.doc(currentUser!.uid).get();
    final List<Map<String, dynamic>> listOfMaps =
        List<Map<String, dynamic>>.from(documentSnapshot['liked']);
    final int indexToRemove = index; // Replace with your desired index
    listOfMaps.removeAt(indexToRemove);
    await collectionRef.doc(currentUser!.uid).update({
      'liked': listOfMaps,
    });
    liked.removeAt(index);
    notifyListeners();
  }
}
