import 'package:flutter/material.dart';
import '../../../core/widgets/responsive_builder.dart';
import 'desktop/desktop_layout_home_page_view.dart';
import 'mobile/mobile_layout_home_page_view.dart';
import 'tablet/tablet_layout_home_page_view.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileLayoutHomePageView(),
      tabletLayout: TabletLayoutHomePageView(),
      desktopLayout: DesktopLayoutHomePageView(),
    );
  }
}
