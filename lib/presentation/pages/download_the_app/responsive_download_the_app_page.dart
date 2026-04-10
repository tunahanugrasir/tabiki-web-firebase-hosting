import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tabiki_web/core/constants/store_links.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_download_the_app_page.dart';
import 'package:web/web.dart' as html;

class ResponsiveDownloadTheAppPage extends StatefulWidget {
  const ResponsiveDownloadTheAppPage({super.key});

  @override
  State<ResponsiveDownloadTheAppPage> createState() =>
      _ResponsiveDownloadTheAppPageState();
}

class _ResponsiveDownloadTheAppPageState
    extends State<ResponsiveDownloadTheAppPage> {
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();
    _redirectMobileUsersToStore();
  }

  void _redirectMobileUsersToStore() {
    if (!kIsWeb) {
      return;
    }

    final userAgent = html.window.navigator.userAgent.toLowerCase();
    final isAndroid = userAgent.contains('android');
    final isIOS = userAgent.contains('iphone') ||
        userAgent.contains('ipad') ||
        userAgent.contains('ipod');

    if (!isAndroid && !isIOS) {
      return;
    }

    setState(() {
      _isRedirecting = true;
    });

    final storeUrl = isIOS ? appStoreUrl : playStoreUrl;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      html.window.location.replace(storeUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isRedirecting) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo/tabiki-appbar-logo.png',
                  width: 120,
                ),
                const SizedBox(height: 24),
                const CircularProgressIndicator(),
                const SizedBox(height: 24),
                const Text(
                  'İndirme sayfasına yönlendiriliyorsunuz...',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return const ResponsiveBuilder(
      mobileLayout: MobileDownloadTheAppPage(),
      tabletLayout: TabletDownloadTheAppPage(),
      desktopLayout: DesktopDownloadTheAppPage(),
    );
  }
}
