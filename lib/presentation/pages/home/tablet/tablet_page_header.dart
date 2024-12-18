import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/contact/responsive_contact_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/responsive_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/israf/responsive_layout_israf_page.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/responsive_be_a_producer_page.dart';
import 'package:tabiki_web/presentation/pages/home/responsive_home_page.dart';
import 'package:tabiki_web/presentation/pages/stores/responsive_stores_page.dart';

class TabletPageHeader extends StatelessWidget {
  const TabletPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.02,
        vertical: 8,
      ),
      child: Column(
        children: [
          // Logo ve üst sıra butonları
          Row(
            children: [
              // Logo
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveHomePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "tabiki",
                      maxLines: 1,
                      style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.bold,
                        fontSize: context.sized.width * 0.035,
                        color: const Color.fromRGBO(51, 110, 122, 1),
                      ),
                    ),
                  ),
                ),
              ),

              // Üst sıra butonları
              Expanded(
                flex: 7,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildNavButton(
                        context: context,
                        title: "Üreticimiz Ol",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResponsiveBeAProducerPage(),
                          ),
                        ),
                      ),
                      _buildNavButton(
                        context: context,
                        title: "Uygulamamızı İndir",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResponsiveDownloadTheAppPage(),
                          ),
                        ),
                      ),
                      _buildNavButton(
                        context: context,
                        title: "İsrafı Önleyelim",
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResponsiveLayoutIsrafPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Alt sıra butonları
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavButton(
                  context: context,
                  title: "Mağazalarımız",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResponsiveLayoutStoresPage(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                _buildNavButton(
                  context: context,
                  title: "İletişim",
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResponsiveContactPage(),
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

  Widget _buildNavButton({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => states.contains(WidgetState.pressed) ? const Color.fromRGBO(51, 110, 122, 0.1) : Colors.transparent,
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(const Color.fromRGBO(51, 110, 122, 1)),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.merriweather(
            fontSize: context.sized.width * 0.018,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(51, 110, 122, 1),
          ),
        ),
      ),
    );
  }
}
