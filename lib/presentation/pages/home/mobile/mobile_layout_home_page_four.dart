import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobileHomePageFour extends StatelessWidget {
  const MobileHomePageFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/mobile/local.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: context.sized.width * 0.1, right: context.sized.width * 0.1, top: context.sized.height * 0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TAMAMEN YEREL",
              style: GoogleFonts.merriweather(
                fontSize: context.sized.height * 0.02,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Ürünler tarlalardan ve çiftliklerden sofranıza ortalama 60 kilometre yol kat ediyor. Her bölgede, benzersiz yerel ürünler ile karşınızdayız.",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.height * 0.02,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
