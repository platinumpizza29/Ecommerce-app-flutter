import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class Products {
  // Future<List<dynamic>> getAllProducts() async {
  //   var uri = "https://fakestoreapi.com/products";
  //   Response response = await Dio().get(uri);
  //   return response.data;
  // }
  final String title;
  final String imageUrl;
  final String description;
  final String price;
  Products(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.price});
}

Future<List<Products>> getAllProducts() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Products').get();

  List<Products> products = [];

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    Products product = Products(
        title: doc['title'],
        imageUrl: doc['image'],
        description: doc['description'],
        price: doc['price']);
    products.add(product);
  }

  return products;
}
