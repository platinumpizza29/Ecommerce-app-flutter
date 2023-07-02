// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:ecommerce/Pages/CartPage.dart';
import 'package:ecommerce/Pages/LikedPage.dart';
import 'package:ecommerce/Pages/LoginPage.dart';
import 'package:ecommerce/Pages/ProfilePage.dart';
import 'package:ecommerce/Pages/SettingsPage.dart';
import 'package:ecommerce/Services/UserService.dart';
import 'package:ecommerce/Services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerComp extends StatelessWidget {
  DrawerComp({super.key});

  final User? user = AuthService().currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        foregroundImage: AssetImage("images/boy.png"),
                        backgroundColor: Color(0xFF353535),
                      )),
                  title: Text(
                    "${user!.email}",
                    style: GoogleFonts.spaceGrotesk(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => CartPage()));
                  },
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  title: Text(
                    "My Cart",
                    style: GoogleFonts.spaceGrotesk(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => LikedPage()));
                  },
                  leading: Icon(CupertinoIcons.heart, color: Colors.black),
                  title: Text(
                    "Liked",
                    style: GoogleFonts.spaceGrotesk(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(CupertinoIcons.person, color: Colors.black),
                  title: Text(
                    "Profile",
                    style: GoogleFonts.spaceGrotesk(
                        color: Colors.black, fontSize: 25),
                  ),
                  onTap: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ProfilePage())),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ListTile(
                  onTap: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SettingsPage())),
                  leading: Icon(CupertinoIcons.settings, color: Colors.black),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.spaceGrotesk(
                        color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Expanded(child: Text("")),
              CupertinoButton(
                child: Text("Logout",
                    style: GoogleFonts.spaceGrotesk(color: Colors.white)),
                onPressed: () async {
                  await AuthService().signOut();
                },
                color: CupertinoColors.systemRed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
