import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TabletHomePageFour extends StatelessWidget {
  const TabletHomePageFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      width: context.sized.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/header-4-background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: context.sized.height * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "TAMAMEN YEREL",
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Ürünler tarlalardan ve çiftliklerden sofranıza\nortalama 60 kilometre yol kat ediyor.\nHer bölgede, benzersiz yerel ürünler ile karşınızdayız.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.width * 0.015,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
