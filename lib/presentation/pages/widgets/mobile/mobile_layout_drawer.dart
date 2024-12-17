import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/responsive_be_a_producer_page.dart';
import 'package:tabiki_web/presentation/pages/contact/responsive_contact_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/responsive_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/home/mobile/mobile_layout_home_page_view.dart';
import 'package:tabiki_web/presentation/pages/israf/responsive_layout_israf_page.dart';
import 'package:tabiki_web/presentation/pages/stores/responsive_stores_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  static void showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00712D).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'tabiki',
                        style: TextStyle(
                          color: Color(0xFF00712D),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.grey[600],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Uygulamamızı İndirin',
                  style: GoogleFonts.merriweather(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00712D),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'tabiki uygulamasını indirerek üreticileri keşfedin ve yerel üretimi destekleyin!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildStoreButtonNew(
                  'App Store',
                  'assets/icons/app-store.png',
                  'iOS cihazlar için',
                  () {
                    // TODO: Add App Store link
                  },
                ),
                const SizedBox(height: 16),
                _buildStoreButtonNew(
                  'Play Store',
                  'assets/icons/play-store.png',
                  'Android cihazlar için',
                  () {
                    // TODO: Add Play Store link
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      children: const [
                        TextSpan(text: '1M+ '),
                        TextSpan(
                          text: 'indirme',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildStoreButtonNew(
    String storeName,
    String imagePath,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 32,
                width: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storeName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00712D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(flex: 1),
                    OutlinedButton(
                      onPressed: () => MobileDrawer.showDownloadDialog(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff00712D)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'UYGULAMAMIZI İNDİR',
                            style: TextStyle(
                              color: Color(0xff00712D),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xff00712D),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                children: [
                  _buildDrawerItem(
                    icon: Icons.home_rounded,
                    title: 'Ana Sayfa',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MobileLayoutHomePageView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildDrawerItem(
                    icon: Icons.store_rounded,
                    title: 'Üreticimiz Ol',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveBeAProducerPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildDrawerItem(
                    icon: Icons.download_rounded,
                    title: 'Uygulamamızı İndir',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveDownloadTheAppPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildDrawerItem(
                    icon: Icons.eco_rounded,
                    title: 'İsrafı Önleyelim',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveLayoutIsrafPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildDrawerItem(
                    icon: Icons.location_on_rounded,
                    title: 'Mağazalarımız',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveLayoutStoresPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildDrawerItem(
                    icon: Icons.contact_support_rounded,
                    title: 'İletişim',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveContactPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/mobile/tabiki-logo.png',
                    height: context.sized.height * 0.1,
                    color: const Color(0xff00712d),
                  ),
                  const Text(
                    '© 2024 tabiki. Tüm hakları saklıdır.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(FontAwesomeIcons.facebook, () {}),
                      _buildSocialIcon(FontAwesomeIcons.instagram, () {}),
                      _buildSocialIcon(FontAwesomeIcons.twitter, () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF336E7A).withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF336E7A),
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.merriweather(
            color: const Color(0xFF336E7A),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF336E7A),
          size: 16,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF336E7A).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: const Color(0xFF336E7A), size: 20),
        onPressed: onTap,
      ),
    );
  }
}
