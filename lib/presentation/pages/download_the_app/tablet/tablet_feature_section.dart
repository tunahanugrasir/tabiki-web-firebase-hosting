import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

Widget tabletBuildFeatureSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    child: Column(
      children: [
        Column(
          children: [
            Text(
              "Neden tabiki?",
              style: GoogleFonts.merriweather(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF065F46),
              ),
            ).animate().fadeIn(),
            const SizedBox(height: 16),
            Text(
              "Çünkü doğallığı özledik. Çünkü yerel üreticiyi desteklemek istiyoruz.",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 24,
                color: const Color(0xFF065F46).withOpacity(0.8),
                height: 1.5,
              ),
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 24),
            Text(
              "tabiki, köylerden sofralarınıza uzanan bir köprü",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF059669),
                height: 1.5,
              ),
            ).animate().fadeIn(delay: 400.ms),
          ],
        ),
        const SizedBox(height: 64),
        Center(
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: context.sized.width * 0.8,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    _buildFeatureDetailCard(
                      context,
                      Icons.agriculture_rounded,
                      "Çiftçinin emeği değerini buluyor",
                      "Yerel üreticilerimiz ürünlerini aracı olmadan doğrudan size ulaştırıyor. Kazanan hem sizsiniz hem de üretici.",
                    ),
                    _buildFeatureDetailCard(
                      context,
                      Icons.eco_rounded,
                      "Siz ne yiyorsanız, biz de onu yiyoruz",
                      "Sağlıklı, doğal, kimyasal ilaçlardan uzak ürünler, doğrudan üreticiden sofranıza geliyor.",
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.sized.width * 0.8,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    _buildFeatureDetailCard(
                      context,
                      Icons.timer_rounded,
                      "Lezzetin en tazesi, aracısız",
                      "Mevsiminde toplanan sebze, meyve ve köy ürünleri en hızlı şekilde size teslim edilir. Tazelik garantisi bizden!",
                    ),
                    _buildFeatureDetailCard(
                      context,
                      Icons.favorite_rounded,
                      "Alışverişinize anlam katın",
                      "Bir siparişle sadece doğal ürünlere ulaşmazsınız; aynı zamanda çiftçinin emeğini, doğayı ve sürdürülebilir tarımı desteklemiş olursunuz.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Text(
                "Birlikte daha sağlıklı, daha sürdürülebilir bir dünya için: tabiki.",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF059669),
                  height: 1.5,
                ),
              ).animate().fadeIn(delay: 600.ms),
              const SizedBox(height: 32),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF059669),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF059669).withOpacity(0.2),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.eco_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Yerel üreticiye destek olun, sağlıklı sofralar kurun",
                        style: GoogleFonts.merriweather(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: 800.ms).shimmer(
                    duration: 2000.ms,
                    color: Colors.white.withOpacity(0.2),
                  ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildFeatureDetailCard(
  BuildContext context,
  IconData icon,
  String title,
  String description,
) {
  return Container(
    width: context.sized.width * 0.38,
    height: 280,
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF34D399).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF059669),
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: GoogleFonts.merriweather(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Text(
            description,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withOpacity(0.8),
              height: 1.6,
            ),
          ),
        ),
      ],
    ),
  ).animate().fadeIn().slideY(begin: 0.2);
}
