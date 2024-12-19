import 'package:flutter/material.dart';
import 'package:tabiki_web/core/widgets/responsive_builder.dart';
import 'package:tabiki_web/presentation/pages/legal-notices/desktop/desktop_layout_legal_notices.dart';
import 'package:tabiki_web/presentation/pages/legal-notices/mobile/mobile_layout_legal_notices.dart';
import 'package:tabiki_web/presentation/pages/legal-notices/tablet/tablet_layout_legal_notices.dart';

class ResponsiveLayoutLegalNotices extends StatelessWidget {
  const ResponsiveLayoutLegalNotices({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileLayoutLegalNotices(),
      tabletLayout: TabletLayoutLegalNotices(),
      desktopLayout: DesktopLayoutLegalNotices(),
    );
  }
}
