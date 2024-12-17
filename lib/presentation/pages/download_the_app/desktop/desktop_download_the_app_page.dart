import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_feature_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_hero_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_qr_download_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_reviews_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/desktop/desktop_screenshot_section.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_page_header.dart';

class DesktopDownloadTheAppPage extends StatefulWidget {
  const DesktopDownloadTheAppPage({super.key});

  @override
  State<DesktopDownloadTheAppPage> createState() => _DesktopDownloadTheAppPageState();
}

class _DesktopDownloadTheAppPageState extends State<DesktopDownloadTheAppPage> {
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.width * 0.1,
                  vertical: context.sized.height * 0.05,
                ),
                child: const DesktopPageHeader(),
              ),
              desktopBuildHeroSection(context),
              desktopBuildDownloadSection(context),
              dekstopBuildScreenshotsSection(context),
              desktopBuildFeatureSection(context),
              desktopBuildReviewsSection(context),
              const HomePageFooter(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
