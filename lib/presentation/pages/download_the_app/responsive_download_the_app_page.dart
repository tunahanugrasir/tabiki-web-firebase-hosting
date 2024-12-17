import 'package:flutter/material.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_download_the_app_page.dart';


class ResponsiveDownloadTheAppPage extends StatelessWidget {
  const ResponsiveDownloadTheAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileDownloadTheAppPage(),
      tabletLayout: TabletDownloadTheAppPage(),
      desktopLayout: DesktopDownloadTheAppPage(),
    );
  }
}
