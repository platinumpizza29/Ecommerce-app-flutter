// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;

  const ProductDetails(
      {super.key,
      required this.description,
      required this.image,
      required this.price,
      required this.title});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(CupertinoIcons.chevron_back)),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart))
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: Container(
            child: Image.network(widget.image),
          )),
          Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.title,
                            style: GoogleFonts.spaceGrotesk(
                                color: Colors.black,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.description,
                            style: GoogleFonts.spaceGrotesk(
                                color: Colors.grey.shade900),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "£" + widget.price,
                                style: GoogleFonts.spaceGrotesk(
                                    fontSize: 25, color: Colors.black),
                              ),
                              CupertinoButton(
                                  color: Colors.black,
                                  child: Text(
                                    "Add To basket",
                                    style: GoogleFonts.spaceGrotesk(
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    context.read<CartProvider>().addToCart();
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
        ]));
  }
}
