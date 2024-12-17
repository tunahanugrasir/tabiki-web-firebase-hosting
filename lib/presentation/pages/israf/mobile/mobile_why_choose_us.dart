import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobileWhyChooseUs extends StatelessWidget {
  const MobileWhyChooseUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height * 0.75,
      width: double.infinity,
      color: const Color(0xFFFDF6E7),
      child: Stack(
        children: [
          Positioned(
            left: 30,
            bottom: -context.sized.height * 0.25,
            child: SizedBox(
              height: context.sized.height * 0.5,
              width: context.sized.width,
              child: Image.asset(
                'assets/israf/bag.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: context.sized.height * 0.6,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: context.sized.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'NEDEN tabiki\'yi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: context.sized.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00796B),
                  ),
                ),
                SizedBox(height: context.sized.height * 0.01),
                Text(
                  'KULLANMALIYIM?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: context.sized.height * 0.03,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00796B),
                  ),
                ),
                SizedBox(height: context.sized.height * 0.03),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildFeature(
                              context: context,
                              icon: Icons.handshake,
                              title: 'ÇİFTÇİDEN SOFRANIZA, ARADA KİMSE YOK',
                              color: const Color(0xFF1E4D56),
                            ),
                          ),
                          Expanded(
                            child: _buildFeature(
                              context: context,
                              icon: Icons.emoji_nature,
                              title: 'İSRAFI ÖNLERKEN KAZANIRSINIZ!',
                              color: const Color(0xFF1E4D56),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildFeature(
                              context: context,
                              icon: Icons.eco,
                              title: 'TAZELİK VE DOĞALLIK GARANTİSİ',
                              color: const Color(0xFF1E4D56),
                            ),
                          ),
                          Expanded(
                            child: _buildFeature(
                              context: context,
                              icon: Icons.favorite,
                              title: 'HER ÜRÜN BİR DEĞER, HER ALIŞVERİŞ BİR DESTEK!',
                              color: const Color(0xFF1E4D56),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature({
    required IconData icon,
    required String title,
    required Color color,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: context.sized.width * 0.08,
              color: color,
            ),
          ),
          SizedBox(height: context.sized.height * 0.015),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: context.sized.width * 0.035,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
