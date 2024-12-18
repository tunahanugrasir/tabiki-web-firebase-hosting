import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:url_launcher/url_launcher.dart';

class TabletHomePageFooter extends StatelessWidget {
  final Color? backgroundColor;
  final Gradient? gradient;
  const TabletHomePageFooter({
    super.key,
    this.backgroundColor,
    this.gradient,
  });

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final footerHeight = context.sized.height;

    return Container(
      height: footerHeight,
      width: context.sized.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: gradient ??
            (backgroundColor == null
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF0FDF4),
                      Color(0xFFDCFCE7),
                    ],
                  )
                : null),
        image: const DecorationImage(
          image: AssetImage('assets/images/footer-clear.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                top: context.sized.height * 0.375,
                right: context.sized.width * 0.3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "tabiki",
                          style: GoogleFonts.merriweather(
                            fontSize: context.sized.width * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildStoreButtons(context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildFooterColumn(
                      context,
                      title: "Hizmetlerimiz",
                      items: const ["Üreticimiz Ol", "Uygulamamızı İndir", "Mağazalarımız"],
                    ),
                  ),
                  Expanded(
                    child: _buildFooterColumn(
                      context,
                      title: "Bizi Takip Edin",
                      items: const ["Instagram", "Facebook", "Youtube", "Twitter", "LinkedIn"],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: context.sized.height * 0.02,
              left: context.sized.width * 0.05,
            ),
            child: Text(
              "Legal Notices - Terms & Conditions - Privacy policy",
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.015,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButtons(BuildContext context) {
    return SizedBox(
      width: context.sized.width * 0.25,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: [
          _buildStoreButton(
            context,
            icon: const Icon(Icons.apple, color: Colors.white, size: 20),
            title: 'App Store',
            subtitle: 'Download on the',
            onTap: () => _launchURL('https://apps.apple.com/your-app-link'),
          ),
          _buildStoreButton(
            context,
            icon: Image.asset(
              "assets/icons/play-store.webp",
              fit: BoxFit.contain,
              height: 20,
            ),
            title: 'Google Play',
            subtitle: 'GET IT ON',
            onTap: () => _launchURL('https://play.google.com/store/apps/your-app-link'),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton(
    BuildContext context, {
    required Widget icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.sized.height * 0.045,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: context.sized.width * 0.008,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: context.sized.width * 0.012,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterColumn(
    BuildContext context, {
    required String title,
    required List<String> items,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.merriweather(
            fontSize: context.sized.width * 0.02,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(185, 224, 224, 1),
          ),
        ),
        const SizedBox(height: 20),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                item,
                style: GoogleFonts.merriweather(
                  fontSize: context.sized.width * 0.015,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
