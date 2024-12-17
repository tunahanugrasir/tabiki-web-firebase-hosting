import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/israf/bag.png',
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Neden Bizi Tercih Etmelisiniz?',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A237E),
                ),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _buildFeature(
                          icon: Icons.handshake_rounded,
                          title: 'Çiftçiden Sofranıza,\nArada Kimse Yok!',
                          description: 'Üreticilerle doğrudan çalışarak taze, güvenilir ve uygun fiyatlı ürünler sunuyoruz.',
                          color: const Color(0xFF4CAF50),
                        ),
                        const SizedBox(height: 30),
                        _buildFeature(
                          icon: Icons.emoji_nature_rounded,
                          title: 'İsrafı Önlerken\nKazanırsınız!',
                          description: 'Standart dışı ancak tüketilebilir ürünleri ekonomik fiyatlarla sunarak bütçenize katkı sağlayın.',
                          color: const Color(0xFF2196F3),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _buildFeature(
                          icon: Icons.eco_rounded,
                          title: 'Tazelik ve Doğallık\nGarantisi!',
                          description: 'Soğuk hava depolarımız ve hızlı teslimatla en taze ürünleri sofralarınıza ulaştırıyoruz.',
                          color: const Color(0xFFF44336),
                        ),
                        const SizedBox(height: 30),
                        _buildFeature(
                          icon: Icons.favorite_rounded,
                          title: 'Her Ürün Bir Değer,\nHer Alışveriş Bir Destek!',
                          description: 'Alışverişlerinizle üreticileri destekler, israfı önler ve sürdürülebilir geleceğe katkı sağlarsınız.',
                          color: const Color(0xFF9C27B0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(height: 32),
              Text(
                'Sürdürülebilir bir gelecek için birlikte çalışıyoruz',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 36,
              color: color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A237E),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
