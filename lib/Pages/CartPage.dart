// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> cartItems = context.watch<CartProvider>().basketItems;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back)),
        title: Text(
          "My Cart",
          style: GoogleFonts.spaceGrotesk(),
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          // TODO: implement build
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(cartItems[index]["image"]),
              trailing: IconButton(
                onPressed: () {
                  context.read<CartProvider>().removeFromBasket(index);
                },
                icon: Icon(
                  CupertinoIcons.trash,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              title: Text(
                cartItems[index]["title"],
                style: GoogleFonts.spaceGrotesk(fontSize: 25),
              ),
              subtitle: Text(
                "£" + cartItems[index]["price"],
                style: GoogleFonts.spaceGrotesk(fontSize: 17),
              ),
            ),
          );
        },
      ),
    );
  }
}
