import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_feature_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_hero_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_qr_download_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_reviews_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/tablet/tablet_screenshot_section.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_page_header.dart';

class TabletDownloadTheAppPage extends StatefulWidget {
  const TabletDownloadTheAppPage({super.key});

  @override
  State<TabletDownloadTheAppPage> createState() => _TabletDownloadTheAppPageState();
}

class _TabletDownloadTheAppPageState extends State<TabletDownloadTheAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF0FDF4),
              Color(0xFFDCFCE7),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TabletPageHeader(),
              tabletBuildHeroSection(context),
              tabletBuildDownloadSection(context),
              tabletBuildScreenshotsSection(context),
              tabletBuildFeatureSection(context),
              tabletBuildReviewsSection(context),
              const TabletHomePageFooter(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
