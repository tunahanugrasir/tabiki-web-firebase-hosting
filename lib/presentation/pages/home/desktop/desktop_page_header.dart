import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/contact/responsive_contact_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/responsive_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/israf/responsive_layout_israf_page.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/responsive_be_a_producer_page.dart';
import 'package:tabiki_web/presentation/pages/home/responsive_home_page.dart';
import 'package:tabiki_web/presentation/pages/stores/responsive_stores_page.dart';

class DesktopPageHeader extends StatelessWidget {
  const DesktopPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResponsiveHomePage(),
                ),
              );
            },
            child: Text(
              "tabiki",
              maxLines: 3,
              style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
                fontSize: context.sized.width * 0.03,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveBeAProducerPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
            surfaceTintColor: Colors.transparent,
          ),
          child: Text(
            "Üreticimiz Ol",
            style: GoogleFonts.merriweather(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(51, 110, 122, 1),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveDownloadTheAppPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
            surfaceTintColor: Colors.transparent,
          ),
          child: Text(
            "Uygulamamızı İndir",
            style: GoogleFonts.merriweather(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(51, 110, 122, 1),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutIsrafPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
            surfaceTintColor: Colors.transparent,
          ),
          child: Text(
            "İsrafı Önleyelim",
            style: GoogleFonts.merriweather(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(51, 110, 122, 1),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutStoresPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
            surfaceTintColor: Colors.transparent,
          ),
          child: Text(
            "Mağazalarımız",
            style: GoogleFonts.merriweather(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(51, 110, 122, 1),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveContactPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
            surfaceTintColor: Colors.transparent,
          ),
          child: Text(
            "İletişim",
            style: GoogleFonts.merriweather(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(51, 110, 122, 1),
            ),
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }
}
