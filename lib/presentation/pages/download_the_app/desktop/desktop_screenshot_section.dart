import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Widget dekstopBuildScreenshotsSection(BuildContext context) {
  return Container(
    width: context.sized.width,
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    child: Column(
      children: [
        Column(
          children: _screenshotDetails.map((details) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                    width: context.sized.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          details['title']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF065F46),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          details['description']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(
                            fontSize: 18,
                            color: const Color(0xFF065F46).withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2),
                  const SizedBox(height: 24),
                  Container(
                    width: context.sized.width,
                    height: context.sized.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        details['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                        duration: 2000.ms,
                        color: Colors.white.withValues(alpha: 0.2),
                      )
                      .animate()
                      .scale(
                        duration: 800.ms,
                        curve: Curves.easeOutBack,
                      ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}

final List<Map<String, String>> _screenshotDetails = [
  {
    'image': 'assets/mockups/1.webp',
    'title': 'Bölgenizdeki Üreticileri ve Ürünlerini Keşfedin',
    'description': 'Yerel üreticilerimizin taze ve doğal ürünlerine doğrudan ulaşın',
  },
  {
    'image': 'assets/mockups/2.webp',
    'title': 'İstediğiniz Yere, İstediğiniz Zaman Sipariş Verin',
    'description': 'Siparişlerinizi kolayca oluşturun ve anlık olarak takip edin',
  },
];
