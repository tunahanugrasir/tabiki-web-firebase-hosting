import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobileHowItWorks extends StatelessWidget {
  const MobileHowItWorks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height * 0.8,
      width: double.infinity,
      color: const Color(0xFFFDF6E7),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: -context.sized.height * 0.72,
            right: 0,
            child: Image.asset(
              'assets/mobile/israf.png',
              fit: BoxFit.contain,
              width: context.sized.width,
              height: context.sized.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nasıl Çalışır?',
                  style: TextStyle(
                    fontSize: context.sized.width * 0.05,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: context.sized.height * 0.02),
                Text(
                  'Lezzeti Aynı, İsrafı Sıfır: Taze Ürünler Daha Uygun Fiyatlarla!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: context.sized.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: context.sized.width * 0.05,
                      color: Colors.black87,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Üreticilerin hala taze ve lezzetli ürünlerini keşfedin. Hemen katılın ve',
                      ),
                      TextSpan(
                        text: '\n%30\'a varan tasarruf sağlayın!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}