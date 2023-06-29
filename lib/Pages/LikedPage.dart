// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> likedItems = context.watch<CartProvider>().likedItems;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back)),
        title: Text(
          "Liked",
          style: GoogleFonts.spaceGrotesk(),
        ),
      ),
      body: ListView.builder(
        itemCount: likedItems.length,
        itemBuilder: (context, index) {
          // TODO: implement build
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(likedItems[index]["image"]),
              trailing: IconButton(
                onPressed: () {
                  context.read<CartProvider>().removeFromLiked(index);
                },
                icon: Icon(
                  CupertinoIcons.trash,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              title: Text(
                likedItems[index]["title"],
                style: GoogleFonts.spaceGrotesk(fontSize: 25),
              ),
              subtitle: Text(
                "£" + likedItems[index]["price"],
                style: GoogleFonts.spaceGrotesk(fontSize: 17),
              ),
            ),
          );
        },
      ),
    );
  }
}
