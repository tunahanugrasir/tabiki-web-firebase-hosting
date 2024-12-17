import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Widget mobileDownloadHeroSection(BuildContext context) {
  return SizedBox(
    height: context.sized.height,
    width: context.sized.width,
    child: Stack(
      children: [
        Positioned(
          top: context.sized.height * 0.5,
          left: context.sized.width * 0.2,
          child: Image.asset(
            'assets/mockups/3.png',
            height: context.sized.height * 0.5,
            width: context.sized.width * 1.5,
            fit: BoxFit.contain,
          ).animate().fadeIn(delay: 1000.ms).scale(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: context.sized.height * 0.12,
            left: 24,
            right: 24,
            bottom: 40,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF34D399).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Mobil Uygulama",
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF059669),
                  ),
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(),
              const SizedBox(height: 24),
              Text(
                "tabiki'yi Hemen İndirin\nYerel Lezzetlere Ulaşın",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                  height: 1.3,
                ),
              ).animate().fadeIn(delay: 200.ms).slideX(),
              const SizedBox(height: 16),
              Text(
                "Yerel üreticilerden taze ve doğal ürünleri doğrudan kapınıza getiriyoruz.",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  color: const Color(0xFF065F46).withOpacity(0.8),
                  height: 1.6,
                ),
              ).animate().fadeIn(delay: 400.ms).slideX(),
              const SizedBox(height: 32),
              Column(
                children: [
                  _buildStoreButton(
                    context,
                    'assets/icons/app-store.png',
                    'App Store\'dan İndir',
                    () {},
                  ).animate().fadeIn(delay: 600.ms).slideX(),
                  const SizedBox(height: 16),
                  _buildStoreButton(
                    context,
                    'assets/icons/play-store.png',
                    'Google Play\'den İndir',
                    () {},
                  ).animate().fadeIn(delay: 800.ms).slideX(),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildStoreButton(
  BuildContext context,
  String imagePath,
  String text,
  VoidCallback onPressed,
) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
        ],
      ),
    ),
  );
}
