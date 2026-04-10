import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/core/widgets/optimized_asset_image.dart';

Widget tabletBuildScreenshotsSection(BuildContext context) {
  final screenWidth = context.sized.width;
  final screenHeight = context.sized.height;
  final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

  return Container(
    width: screenWidth,
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 32),
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
                            color:
                                const Color(0xFF065F46).withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.2),
                  const SizedBox(height: 24),
                  RepaintBoundary(
                    child: SizedBox(
                      width: screenWidth,
                      height: screenHeight * 0.7,
                      child: OptimizedAssetImage(
                        assetName: details['image']!,
                        fit: BoxFit.contain,
                        borderRadius: BorderRadius.circular(24),
                        cacheWidth: (screenWidth * devicePixelRatio).round(),
                        cacheHeight:
                            (screenHeight * 0.7 * devicePixelRatio).round(),
                      ),
                    ).animate().scale(
                          duration: 500.ms,
                          curve: Curves.easeOutCubic,
                        ),
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
    'description':
        'Yerel üreticilerimizin taze ve doğal ürünlerine doğrudan ulaşın',
  },
  {
    'image': 'assets/mockups/2.webp',
    'title': 'İstediğiniz Yere, İstediğiniz Zaman Sipariş Verin',
    'description':
        'Siparişlerinizi kolayca oluşturun ve anlık olarak takip edin',
  },
];
