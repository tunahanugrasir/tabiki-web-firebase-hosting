import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/core/constants/store_links.dart';
import 'package:tabiki_web/core/widgets/optimized_asset_image.dart';
import 'package:url_launcher/url_launcher.dart';

// URL açma işlemi için yardımcı fonksiyon
Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $urlString');
  }
}

Widget mobileDownloadHeroSection(BuildContext context) {
  final screenHeight = context.sized.height;
  final screenWidth = context.sized.width;
  final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
  final mockupHeight = screenHeight * 0.5;
  final mockupWidth = screenWidth * 1.5;

  return SizedBox(
    height: screenHeight,
    width: screenWidth,
    child: Stack(
      children: [
        Positioned(
          top: screenHeight * 0.5,
          left: screenWidth * 0.2,
          child: RepaintBoundary(
            child: OptimizedAssetImage(
              assetName: 'assets/mockups/3.webp',
              height: mockupHeight,
              width: mockupWidth,
              fit: BoxFit.contain,
              cacheWidth: (mockupWidth * devicePixelRatio).round(),
              cacheHeight: (mockupHeight * devicePixelRatio).round(),
            ).animate().fadeIn(delay: 1000.ms).scale(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.12,
            left: 24,
            right: 24,
            bottom: 40,
          ),
          child: Column(
            children: [
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
                  color: const Color(0xFF065F46).withValues(alpha: 0.8),
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
                    () => _launchUrl(appStoreUrl),
                  ).animate().fadeIn(delay: 600.ms).slideX(),
                  const SizedBox(height: 16),
                  _buildStoreButton(
                    context,
                    'assets/icons/play-store.webp',
                    'Google Play\'den İndir',
                    () => _launchUrl(playStoreUrl),
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
            color: Colors.black.withValues(alpha: 0.1),
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
