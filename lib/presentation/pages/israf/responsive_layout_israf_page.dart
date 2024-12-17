import 'package:flutter/material.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/israf_page.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_israf_page.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_layout_israf_page.dart';

class ResponsiveLayoutIsrafPage extends StatelessWidget {
  const ResponsiveLayoutIsrafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileIsrafPage(),
      tabletLayout: TabletIsrafPage(),
      desktopLayout: IsrafPage(),
    );
  }
}
