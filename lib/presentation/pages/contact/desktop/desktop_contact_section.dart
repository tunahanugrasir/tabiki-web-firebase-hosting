import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, dynamic>> _contactMethods = [
  {
    'icon': Icons.phone_rounded,
    'title': 'Telefon',
    'content': '+90 (530) 697 89 70',
    'action': 'tel:+905306978970',
  },
  {
    'icon': Icons.mail_rounded,
    'title': 'E-posta',
    'content': 'destek@tabiki.co',
    'action': 'mailto:destek@tabiki.co',
  },
  {
    'icon': Icons.location_on_rounded,
    'title': 'Adres',
    'content': 'Cumhuriyet, 500. Sk., 48300\nFethiye/Muğla',
    'action': 'https://maps.google.com/?q=36.623524,29.114460',
  },
  {
    'icon': Icons.access_time_rounded,
    'title': 'Çalışma Saatleri',
    'content': 'Hafta içi: 09:00 - 18:00\nHafta sonu: 10:00 - 17:00',
  },
];

Widget buildContactSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Sol taraf - İletişim kartları
        Expanded(
          child: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: _contactMethods.map((method) {
              return SizedBox(
                width: (context.sized.width * 0.4 - 24) / 2, // 2 kart yan yana
                child: _buildContactCard(
                  context,
                  method['icon'],
                  method['title'],
                  method['content'],
                  method['action'],
                ),
              );
            }).toList(),
          ),
        ),
        // Sağ taraf - Görsel
        Expanded(
          child: Image.asset(
            'assets/be_producer/family-44.webp',
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

Widget _buildContactCard(BuildContext context, IconData icon, String title, String content, [String? action]) {
  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'URL açılamadı: $url',
              style: GoogleFonts.merriweather(),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }
    await launchUrl(uri);
  }

  return MouseRegion(
    cursor: action != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
    child: GestureDetector(
      onTap: action != null ? () => launchURL(action) : null,
      child: Container(
        height: 220,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF34D399).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: const Color(0xFF059669),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.merriweather(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF065F46),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Center(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    color: const Color(0xFF065F46).withValues(alpha: 0.8),
                    height: 1.6,
                  ),
                ),
              ),
            ),
            if (action != null) ...[
              const SizedBox(height: 12),
              Text(
                "Tıklayın",
                style: GoogleFonts.merriweather(
                  fontSize: 14,
                  color: const Color(0xFF059669),
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  ).animate().scale();
}
