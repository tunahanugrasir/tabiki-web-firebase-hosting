import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:marquee/marquee.dart';

class TabletScrollingFoodBanner extends StatelessWidget {
  const TabletScrollingFoodBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height * 0.08,
      color: const Color(0xFF00796B),
      child: Marquee(
        text: _buildMarqueeText(),
        style: GoogleFonts.poppins(
          fontSize: context.sized.width * 0.02,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        blankSpace: 100.0,
        velocity: 80.0,
        pauseAfterRound: const Duration(seconds: 0),
        startPadding: 20.0,
        accelerationDuration: const Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }

  String _buildMarqueeText() {
    return _foodItems.map((food) => '$food  •  ').join('   ');
  }

  static const List<String> _foodItems = [
    'ÇİLEK',
    'BİBER',
    'KİRAZ',
    'ERİK',
    'ARMUT',
    'MARUL',
    'MAYDONOZ',
    'DOMATES',
    'PATATES',
    'SOĞAN',
    'ÜZ��M',
    'PATLICAN',
    'KARPUZ',
    'KAYISI',
    'ŞEFTALİ',
    'YUMURTA',
    'KAVUN',
    'FASULYE',
    'PORTAKAL',
    'MANDALİNA',
    'BROKOLİ',
    'KABAK',
    'ISPANAK',
    'ZEYTİN',
    'MUZ',
  ];
}


