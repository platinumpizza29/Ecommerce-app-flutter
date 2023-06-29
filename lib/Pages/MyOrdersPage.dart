import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> cartItems = context.watch<CartProvider>().likedItems;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back)),
        title: Text(
          "My Orders",
          style: GoogleFonts.spaceGrotesk(),
        ),
      ),
      body: Center(
        child: LottieBuilder.asset(
          "images/order.json",
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
        ),
      ),
    );
  }
}
