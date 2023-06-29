// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:ecommerce/Components/DrawerComp.dart';
import 'package:ecommerce/Pages/CartPage.dart';
import 'package:ecommerce/Pages/ProductDetails.dart';
import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:ecommerce/Services/ProductService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Products().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Badge(
              label: Text("${context.watch<CartProvider>().count}"),
              child: Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => CartPage()));
            },
          )
        ],
      ),
      drawer: DrawerComp(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                      text: "Top",
                      style: GoogleFonts.spaceGrotesk(fontSize: 30),
                      children: [
                    TextSpan(
                        text: " Picks",
                        style: TextStyle(
                          color: Color(0xFFCAF76F),
                        ))
                  ])),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: getAllProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  print(snapshot.error);
                  return Center(child: Text("No Products"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      color: Color(0xFFCAF76F),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                List<dynamic> products = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Products products1 = products[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProductDetails(
                                  description: products1.description,
                                  image: products1.imageUrl,
                                  price: products1.price,
                                  title: products1.title))),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Colors.grey.shade900,
                        child: Image.network(products1.imageUrl),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
