
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobileHomePageThree extends StatelessWidget {
  const MobileHomePageThree({
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
          image: AssetImage('assets/mobile/three.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: context.sized.width * 0.1, right: context.sized.width * 0.1, bottom: context.sized.height * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "HAK EDİLMİŞ KAZANÇ",
              style: GoogleFonts.merriweather(
                fontSize: context.sized.height * 0.02,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "tabiki'de fiyatları üreticilerimiz belirler. Her siparişin %80'ini doğrudan alırlar. Biz ise pazarlama, satış ve lojistik süreçlerini kolaylaştırırız.",
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

