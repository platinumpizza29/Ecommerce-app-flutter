// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:ecommerce/Pages/RegisterPage.dart';
import 'package:ecommerce/Services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(40, 40))),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Sign In",
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTheme(
                  data: CupertinoThemeData(brightness: Brightness.light),
                  child: CupertinoTextField(
                    controller: _email,
                    suffix: IconButton(
                        onPressed: () {},
                        icon: LineIcon.at(
                          color: CupertinoColors.black,
                        )),
                    placeholder: "Email",
                    placeholderStyle: GoogleFonts.spaceGrotesk(),
                    decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                    padding: EdgeInsets.all(10),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTheme(
                  data: CupertinoThemeData(brightness: Brightness.light),
                  child: CupertinoTextField(
                    controller: _password,
                    suffix: IconButton(
                        onPressed: () {},
                        icon: LineIcon.lock(
                          color: CupertinoColors.black,
                        )),
                    placeholder: "Password",
                    obscureText: true,
                    placeholderStyle: GoogleFonts.spaceGrotesk(),
                    decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                    padding: EdgeInsets.all(10),
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40)),
                  onPressed: () async {
                    try {
                      await AuthService().signInWithEmailAndPassword(
                          email: _email.text, password: _password.text);
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error While Signing in!")));
                    }
                  },
                  child: Text(
                    "Sign-In",
                    style: GoogleFonts.spaceGrotesk(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Color(0xFFD3D8DB),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: LineIcon.googleLogo(color: Colors.white),
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 2.5, 40)),
                    onPressed: () {},
                    label: Text(
                      "Google",
                      style: GoogleFonts.spaceGrotesk(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      icon: LineIcon.facebook(color: Colors.white),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                              MediaQuery.of(context).size.width / 2.5, 40)),
                      onPressed: () {},
                      label: Text(
                        "Facebook",
                        style: GoogleFonts.spaceGrotesk(color: Colors.white),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  "Click here to Register.",
                  style: GoogleFonts.spaceGrotesk(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
