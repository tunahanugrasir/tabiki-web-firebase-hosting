import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget tabletBuildDownloadSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "QR Kodu Okutun\nHemen İndirin",
                style: GoogleFonts.merriweather(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Telefonunuzun kamerasını QR koda tutarak\ntabiki uygulamasını hemen indirebilirsiniz.",
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  color: const Color(0xFF065F46).withValues(alpha: 0.8),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
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
