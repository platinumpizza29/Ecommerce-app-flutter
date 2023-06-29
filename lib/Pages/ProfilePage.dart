// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/Pages/MyOrdersPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.spaceGrotesk(),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: CircleAvatar(
              radius: 70,
              foregroundImage: AssetImage("images/boy.png"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Keyur Bilgi",
              style:
                  GoogleFonts.spaceGrotesk(fontSize: 30, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MyOrdersPage()));
                },
                leading: Icon(
                  CupertinoIcons.mail,
                  color: CupertinoColors.systemGreen,
                ),
                title: Text(
                  "My Orders",
                  style: GoogleFonts.spaceGrotesk(),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.chevron_right))),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: CupertinoColors.systemGreen,
              ),
              title: Text(
                "Email",
                style: GoogleFonts.spaceGrotesk(),
              ),
              trailing: Text(
                "kbelgi1@gmail.com",
                style: GoogleFonts.spaceGrotesk(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(
                CupertinoIcons.number,
                color: CupertinoColors.systemGreen,
              ),
              title: Text(
                "Contact Number",
                style: GoogleFonts.spaceGrotesk(),
              ),
              trailing: Text(
                "+447824886546",
                style: GoogleFonts.spaceGrotesk(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
