import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Widget mobileDownloadScreenshotSection(BuildContext context) {
  return Container(
    width: context.sized.width,
    height: context.sized.height * 3,
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.05,
      vertical: context.sized.height * 0.05,
    ),
    child: Column(
      children: _screenshotDetails.map((details) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: context.sized.height * 0.02,
                horizontal: context.sized.width * 0.05,
              ),
              width: context.sized.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    details['title']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.width * 0.07,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      color: const Color(0xFF065F46),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    details['description']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: context.sized.width * 0.04,
                      height: 1.5,
                      color: const Color(0xFF065F46).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2),
            const SizedBox(height: 20),
            // İlk görsel
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: context.sized.width,
                  height: context.sized.height * 0.5,
                  child: Image.asset(
                    details['images'][0],
                    fit: BoxFit.cover,
                  ),
                ).animate().slideX(
                      begin: 1,
                      end: 0,
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                    ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: context.sized.height * 0.5,
                  width: context.sized.width,
                  child: Image.asset(
                    details['images'][1],
                    fit: BoxFit.cover,
                  ),
                ).animate().slideX(
                      begin: -1,
                      end: 0,
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                    ),
              ),
            ),
          ],
        );
      }).toList(),
    ),
  );
}

final List<Map<String, dynamic>> _screenshotDetails = [
  {
    'images': ['assets/mobile/6.webp', 'assets/mobile/7.webp'],
    'title': 'Bölgenizdeki Üreticileri ve Ürünlerini Keşfedin',
    'description': 'Yerel üreticilerimizin taze ve doğal ürünlerine doğrudan ulaşın',
  },
  {
    'images': ['assets/mobile/8.webp', 'assets/mobile/9.webp'],
    'title': 'İstediğiniz Yere, İstediğiniz Zaman Sipariş Verin',
    'description': 'Siparişlerinizi kolayca oluşturun ve anlık olarak takip edin',
  },
];
