import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_hero_section.dart';
import 'package:url_launcher/url_launcher.dart';
Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $urlString');
  }
}
Widget tabletBuildHeroSection(BuildContext context) {
  return SizedBox(
    height: context.sized.height * 0.8,
    width: context.sized.width,
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sized.width * 0.1,
              vertical: context.sized.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF34D399).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Mobil Uygulama",
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF059669),
                    ),
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(),
                SizedBox(height: context.sized.height * 0.02),
                Text(
                  "tabiki'yi Hemen İndirin\nYerel Lezzetlere Ulaşın",
                  style: GoogleFonts.merriweather(
                    fontSize: context.sized.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF065F46),
                    height: 1.2,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideX(),
                SizedBox(height: context.sized.height * 0.02),
                Text(
                  "Yerel üreticilerden taze ve doğal ürünleri doğrudan kapınıza getiriyoruz. tabiki ile yerel lezzetlere bir tık uzaktasınız.",
                  style: GoogleFonts.merriweather(
                    fontSize: context.sized.width * 0.015,
                    color: const Color(0xFF065F46).withValues(alpha: 0.8),
                    height: 1.6,
                  ),
                ).animate().fadeIn(delay: 400.ms).slideX(),
                SizedBox(height: context.sized.height * 0.02),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    _buildStoreButton(
                      context,
                      'assets/icons/app-store.png',
                      'App Store\'dan İndir',
                       () => _launchUrl(appStoreUrl),
                    ).animate().fadeIn(delay: 600.ms).slideX(),
                    _buildStoreButton(
                      context,
                      'assets/icons/play-store.webp',
                      'Google Play\'den İndir',
                      () => _launchUrl(playStoreUrl),
                    ).animate().fadeIn(delay: 800.ms).slideX(),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Image.asset(
                'assets/mockups/3.webp',
                height: context.sized.height * 0.7,
              )
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
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: max(context.sized.width * 0.2, 200),
          minWidth: min(200, context.sized.width * 0.2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 24,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
