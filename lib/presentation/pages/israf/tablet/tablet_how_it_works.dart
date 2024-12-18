import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_page_header.dart';

class TabletHowItWorks extends StatelessWidget {
  const TabletHowItWorks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.sized.height * 0.7,
          width: double.infinity,
          color: const Color(0xFFFDF6E7),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: -context.sized.height * 0.21,
                right: 0,
                child: Image.asset(
                  'assets/israf/background.webp',
                  height: context.sized.height * 0.75,
                  width: context.sized.width,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nasıl Çalışır?',
                      style: GoogleFonts.poppins(
                        fontSize: context.sized.width * 0.018,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      ' “Lezzeti Aynı, İsrafı Sıfır: Taze Ürünler Daha Uygun Fiyatlarla!”',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: context.sized.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 800,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Üreticilerin hala taze ve lezzetli ürünlerini keşfedin. Hemen katılın ve',
                            ),
                            TextSpan(
                              text: '\n%30’a varan tasarruf sağlayın!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sized.width * 0.1,
              vertical: context.sized.height * 0.05,
            ),
            child: const TabletPageHeader()),
      ],
    );
  }
}
