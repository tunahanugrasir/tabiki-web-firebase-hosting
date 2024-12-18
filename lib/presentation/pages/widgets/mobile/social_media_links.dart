import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bizi takip edin",
          style: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(185, 224, 224, 1),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(FontAwesomeIcons.instagram),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.facebook),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.linkedin),
            const SizedBox(width: 20),
            _buildSocialIcon(FontAwesomeIcons.youtube),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return FaIcon(
      icon,
      size: 30,
      color: Colors.white,
    );
  }
} 