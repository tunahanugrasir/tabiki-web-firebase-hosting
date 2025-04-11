import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_hero_section.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/social_media_links.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileFooter extends StatelessWidget {
  final Color backgroundColor;
  const MobileFooter({super.key, required this.backgroundColor});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height * 1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        image: const DecorationImage(
          image: AssetImage('assets/mobile/footer.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: context.sized.width * 0.1,
          right: context.sized.width * 0.1,
          top: context.sized.height * 0.25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/tabiki-appbar-logo.png",
              fit: BoxFit.contain,
              color: Colors.white,
              height: context.sized.height * 0.075,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () =>
                      _launchURL(appStoreUrl),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.apple, color: Colors.white, size: 20),
                        const SizedBox(width: 4),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Download on the',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              'App Store',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _launchURL(
                     playStoreUrl),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/icons/play-store.webp",
                          fit: BoxFit.contain,
                          height: 20,
                        ),
                        const SizedBox(width: 4),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GET IT ON',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              'Google Play',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SocialMediaLinks(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.go('/yasal-bildirimler'),
                    child: Text(
                      "Yasal Bildirimler",
                      style: GoogleFonts.merriweather(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    " - ",
                    style: GoogleFonts.merriweather(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => context.go('/yasal-bildirimler'),
                    child: Text(
                      "Hizmet Şartları",
                      style: GoogleFonts.merriweather(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    " - ",
                    style: GoogleFonts.merriweather(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => context.go('/yasal-bildirimler'),
                    child: Text(
                      "Gizlilik Politikası",
                      style: GoogleFonts.merriweather(
                        fontSize: 12,
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
      ),
    );
  }
}
