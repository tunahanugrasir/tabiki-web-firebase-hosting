import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/responsive_be_a_producer_page.dart';
import 'package:tabiki_web/presentation/pages/contact/responsive_contact_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/responsive_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/israf/responsive_layout_israf_page.dart';
import 'package:tabiki_web/presentation/pages/stores/responsive_stores_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tabiki_web/presentation/pages/legal-notices/responsive_layout_legal_notices.dart';

class HomePageFooter extends StatelessWidget {
  final Color? backgroundColor;
  final Gradient? gradient;
  const HomePageFooter({
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
    return Container(
      height: context.sized.height,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: context.sized.height * 0.075,
                right: context.sized.width * 0.4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/logo/tabiki-appbar-logo.png",
                          fit: BoxFit.contain,
                          color: Colors.white,
                          width: context.sized.width * 0.1,
                        ),
                        SizedBox(
                          width: context.sized.width * 0.2,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 16,
                            children: [
                              InkWell(
                                onTap: () => _launchURL('https://apps.apple.com/your-app-link'),
                                child: Container(
                                  height: context.sized.height * 0.050,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                onTap: () => _launchURL('https://play.google.com/store/apps/your-app-link'),
                                child: Container(
                                  height: context.sized.height * 0.050,
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hizmetlerimiz",
                          style: GoogleFonts.merriweather(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(185, 224, 224, 1),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveBeAProducerPage()));
                          },
                          child: Text(
                            "Üreticimiz Ol",
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveDownloadTheAppPage()));
                          },
                          child: Text(
                            "Uygulamamızı İndir",
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutStoresPage()));
                          },
                          child: Text(
                            "Mağazalarımız",
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutIsrafPage()));
                          },
                          child: Text(
                            "İsrafı Önleyelim",
                            style: GoogleFonts.merriweather(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveContactPage()));
                          },
                          child: Text(
                            "İletişim",
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bizi Takip Edin",
                          style: GoogleFonts.merriweather(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(185, 224, 224, 1),
                          ),
                        ),
                        Text(
                          "Instagram",
                          style: GoogleFonts.merriweather(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Facebook",
                          style: GoogleFonts.merriweather(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Youtube",
                          style: GoogleFonts.merriweather(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Twitter",
                          style: GoogleFonts.merriweather(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "LinkedIn",
                          style: GoogleFonts.merriweather(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveLayoutLegalNotices(),
                      ),
                    );
                  },
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveLayoutLegalNotices(),
                      ),
                    );
                  },
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveLayoutLegalNotices(),
                      ),
                    );
                  },
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
}
