import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'tabiki',
        style: GoogleFonts.merriweather(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: const Color.fromRGBO(51, 110, 122, 1),
        ),
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
      elevation: 0,
    );
  }
}
