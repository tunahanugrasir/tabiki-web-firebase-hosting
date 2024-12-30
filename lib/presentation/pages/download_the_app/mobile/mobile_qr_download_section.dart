import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget mobileQrDownloadSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 40,
    ),
    color: Colors.white,
    child: Column(
      children: [
        Text(
          "QR Kodu Okutun\nHemen İndirin",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Telefonunuzun kamerasını QR koda tutarak tabiki uygulamasını hemen indirebilirsiniz.",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: const Color(0xFF065F46).withValues(alpha: 0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: QrImageView(
            data: 'https://tabiki.co/download',
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}
