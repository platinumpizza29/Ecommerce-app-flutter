// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Pages/MyOrdersPage.dart';
import 'package:ecommerce/Services/UserService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _editedText = TextEditingController();
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
      body: RefreshIndicator.adaptive(
        onRefresh: () => UserService().getUserInfo(),
        child: Column(
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
            ListTile(
              leading: Icon(
                LineIcons.receipt,
                color: CupertinoColors.activeGreen,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: CupertinoColors.activeGreen,
              ),
              title: Text(
                "My Orders",
                style: GoogleFonts.spaceGrotesk(fontSize: 20),
              ),
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => MyOrdersPage())),
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: UserService().getUserInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CupertinoActivityIndicator(
                        color: CupertinoColors.activeGreen,
                      ));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      if (snapshot.hasData) {
                        Map<String, dynamic> userInfo = snapshot.data!;
                        return ListView.builder(
                          itemCount: userInfo.length,
                          itemBuilder: (context, index) {
                            String key = userInfo.keys.elementAt(index);
                            dynamic value = userInfo[key];
                            return ListTile(
                              leading: IconButton(
                                  onPressed: () => _showModalDialog(key),
                                  icon: Icon(LineIcons.editAlt,
                                      color: CupertinoColors.activeGreen)),
                              title: Text(
                                key,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                value.toString(),
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 17,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text('No user information available.');
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalDialog(String currentText) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          title: Text("Edit User Info"),
          content: TextField(
            controller: _editedText,
            decoration: InputDecoration(label: Text(currentText)),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: GoogleFonts.spaceGrotesk(
                      color: CupertinoColors.destructiveRed),
                )),
            TextButton(
                onPressed: () => UserService()
                    .updateUserInfo(currentText, _editedText.text)
                    .whenComplete(() => Navigator.pop(context)),
                child: Text("Submit"))
          ],
        );
      },
    );
  }
}
