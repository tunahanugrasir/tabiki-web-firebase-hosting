import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TabletWhyChooseUs extends StatelessWidget {
  const TabletWhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.sized.height * 0.05, horizontal: context.sized.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/israf/bag.webp',
              height: context.sized.height * 0.15,
              fit: BoxFit.contain,
            ),
            Text(
              'Neden Bizi Tercih Etmelisiniz?',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: context.sized.width * 0.03,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A237E),
              ),
            ),
            SizedBox(height: context.sized.height * 0.03),
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 600;
                return Wrap(
                  spacing: context.sized.width * 0.03,
                  runSpacing: context.sized.height * 0.02,
                  alignment: WrapAlignment.center,
                  children: [
                    SizedBox(
                      width: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                      child: Column(
                        children: [
                          _buildFeature(
                            context: context,
                            icon: Icons.handshake_rounded,
                            title: 'Çiftçiden Sofranıza,\nArada Kimse Yok!',
                            description: 'Üreticilerle doğrudan çalışarak taze, güvenilir ve uygun fiyatlı ürünler sunuyoruz.',
                            color: const Color(0xFF4CAF50),
                            maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                          ),
                          SizedBox(height: context.sized.height * 0.02),
                          _buildFeature(
                            context: context,
                            icon: Icons.emoji_nature_rounded,
                            title: 'İsrafı Önlerken\nKazanırsınız!',
                            description: 'Standart dışı ancak tüketilebilir ürünleri ekonomik fiyatlarla sunarak bütçenize katkı sağlayın.',
                            color: const Color(0xFF2196F3),
                            maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                          ),
                        ],
                      ),
                    ),
                    if (!isNarrow) SizedBox(width: context.sized.width * 0.02),
                    SizedBox(
                      width: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                      child: Column(
                        children: [
                          _buildFeature(
                            context: context,
                            icon: Icons.eco_rounded,
                            title: 'Tazelik ve Doğallık\nGarantisi!',
                            description: 'Soğuk hava depolarımız ve hızlı teslimatla en taze ürünleri sofralarınıza ulaştırıyoruz.',
                            color: const Color(0xFFF44336),
                            maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                          ),
                          SizedBox(height: context.sized.height * 0.02),
                          _buildFeature(
                            context: context,
                            icon: Icons.favorite_rounded,
                            title: 'Her Ürün Bir Değer,\nHer Alışveriş Bir Destek!',
                            description: 'Alışverişlerinizle üreticileri destekler, israfı önler ve sürdürülebilir geleceğe katkı sağlarsınız.',
                            color: const Color(0xFF9C27B0),
                            maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: context.sized.height * 0.03),
            Text(
              'Sürdürülebilir bir gelecek için birlikte çalışıyoruz',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: context.sized.width * 0.015,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required double maxWidth,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: EdgeInsets.all(maxWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(maxWidth * 0.03),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: maxWidth * 0.08,
              color: color,
            ),
          ),
          SizedBox(height: maxWidth * 0.03),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: maxWidth * 0.035,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              height: 1.3,
            ),
          ),
          SizedBox(height: maxWidth * 0.02),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: maxWidth * 0.028,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
