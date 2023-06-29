import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back)),
        title: Text(
          'Settings',
          style: GoogleFonts.spaceGrotesk(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "APP VERSION",
              style: GoogleFonts.spaceGrotesk(),
            ),
            trailing: Text(
              "1.0.0",
              style: GoogleFonts.spaceGrotesk(
                  color: CupertinoColors.systemGreen, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
