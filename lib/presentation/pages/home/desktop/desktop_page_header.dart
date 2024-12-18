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
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.sized.width,
        maxHeight: context.sized.height * 0.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResponsiveHomePage(),
                  ),
                );
              },
              child: Image.asset(
                'assets/logo/tabiki-appbar-logo.png',
                fit: BoxFit.cover,
                height: context.sized.height * 0.1,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildHeaderButton(
                    "Üreticimiz Ol",
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveBeAProducerPage())),
                  ),
                  _buildHeaderButton(
                    "Uygulamamızı İndir",
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveDownloadTheAppPage())),
                  ),
                  _buildHeaderButton(
                    "İsrafı Önleyelim",
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutIsrafPage())),
                  ),
                  _buildHeaderButton(
                    "Mağazalarımız",
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveLayoutStoresPage())),
                  ),
                  _buildHeaderButton(
                    "İletişim",
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResponsiveContactPage())),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
        surfaceTintColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: GoogleFonts.merriweather(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(51, 110, 122, 1),
        ),
      ),
    );
  }
}
