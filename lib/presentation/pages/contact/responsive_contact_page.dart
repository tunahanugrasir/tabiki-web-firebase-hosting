import 'package:flutter/material.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/contact/desktop/desktop_contact_page.dart';
import 'package:tabiki_web/presentation/pages/contact/mobile/mobile_contact_page.dart';
import 'package:tabiki_web/presentation/pages/contact/tablet/tablet_contact_page.dart';

class ResponsiveContactPage extends StatelessWidget {
  const ResponsiveContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileContactPage(),
      tabletLayout: TabletContactPage(),
      desktopLayout: DesktopContactPage(),
    );
  }
}
