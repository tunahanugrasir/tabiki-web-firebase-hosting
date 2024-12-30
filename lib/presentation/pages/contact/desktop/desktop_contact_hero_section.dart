import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Widget contactHeroSection(BuildContext context) {
  return Container(
    height: context.sized.height * 0.4,
    width: context.sized.width,
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF34D399).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "İletişim",
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF059669),
            ),
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(),
        const SizedBox(height: 24),
        Text(
          "Size Nasıl\nYardımcı Olabiliriz?",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
            height: 1.2,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(),
        const SizedBox(height: 24),
        Text(
          "Sorularınız için bize ulaşabilir, önerilerinizi paylaşabilirsiniz.",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 18,
            color: const Color(0xFF065F46).withValues(alpha: 0.8),
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 400.ms).slideX(),
      ],
    ),
  );
}
