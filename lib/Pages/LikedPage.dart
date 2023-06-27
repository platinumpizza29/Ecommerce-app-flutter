import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Liked",
          style: GoogleFonts.spaceGrotesk(),
        ),
      ),
    );
  }
}
