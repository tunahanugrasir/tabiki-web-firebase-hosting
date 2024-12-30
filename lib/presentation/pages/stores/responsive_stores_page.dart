import 'package:flutter/material.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/stores/desktop/desktop_stores_page.dart';
import 'package:tabiki_web/presentation/pages/stores/mobile/mobile_stores_page.dart';
import 'package:tabiki_web/presentation/pages/stores/tablet/tablet_stores_page.dart';

class ResponsiveLayoutStoresPage extends StatelessWidget {
  const ResponsiveLayoutStoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileStoresPage(),
      tabletLayout: TabletStoresPage(),
      desktopLayout: DesktopStoresPage(),
    );
  }
}
