import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_hero_section.dart';
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
                        Image.asset(
                          "assets/logo/tabiki-appbar-logo.png",
                          fit: BoxFit.contain,
                          color: Colors.white,
                          width: context.sized.width * 0.1,
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
                      items: const [
                        "Üreticimiz Ol",
                        "Uygulamamızı İndir",
                        "Mağazalarımız",
                        "İsrafı Önleyelim",
                        "İletişim"
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildFooterColumn(
                      context,
                      title: "Bizi Takip Edin",
                      items: const [
                        "Instagram",
                        "Facebook",
                        "Youtube",
                        "Twitter",
                        "LinkedIn"
                      ],
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.go('/yasal-bildirimler'),
                  child: Text(
                    "Yasal Bildirimler",
                    style: GoogleFonts.merriweather(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  " - ",
                  style: GoogleFonts.merriweather(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => context.go('/yasal-bildirimler'),
                  child: Text(
                    "Hizmet Şartları",
                    style: GoogleFonts.merriweather(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  " - ",
                  style: GoogleFonts.merriweather(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => context.go('/yasal-bildirimler'),
                  child: Text(
                    "Gizlilik Politikası",
                    style: GoogleFonts.merriweather(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
            onTap: () => _launchURL(appStoreUrl),
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
            onTap: () =>
                _launchURL(playStoreUrl),
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
              child: InkWell(
                onTap: () {
                  switch (item) {
                    case "İletişim":
                      context.go('/iletisim');
                      break;
                    case "Instagram":
                      _launchURL('https://instagram.com/tabikiapp');
                      break;
                    case "Facebook":
                      _launchURL('https://facebook.com/tabikiapp');
                      break;
                    case "Youtube":
                      _launchURL('https://youtube.com/tabikiapp');
                      break;
                    case "Twitter":
                      _launchURL('https://twitter.com/tabikiapp');
                      break;
                    case "LinkedIn":
                      _launchURL('https://linkedin.com/company/tabikiapp');
                      break;
                    case "Üreticimiz Ol":
                      context.go('/ureticimiz-ol');
                      break;
                    case "Uygulamamızı İndir":
                      context.go('/uygulamamizi-indir');
                      break;
                    case "Mağazalarımız":
                      context.go('/magazalarimiz');
                      break;
                    case "İsrafı Önleyelim":
                      context.go('/israfi-onleyelim');
                      break;
                  }
                },
                child: Text(
                  item,
                  style: GoogleFonts.merriweather(
                    fontSize: context.sized.width * 0.015,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
