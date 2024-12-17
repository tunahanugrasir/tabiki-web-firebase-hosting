import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_feature_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_hero_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_reviews_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_download_screenshot_section.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/mobile/mobile_qr_download_section.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_app_bar.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_footer.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_layout_drawer.dart';

class MobileDownloadTheAppPage extends StatefulWidget {
  const MobileDownloadTheAppPage({super.key});

  @override
  State<MobileDownloadTheAppPage> createState() => _MobileDownloadTheAppPageState();
}

class _MobileDownloadTheAppPageState extends State<MobileDownloadTheAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MobileAppBar(),
      ),
      drawer: const MobileDrawer(),
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
              mobileDownloadHeroSection(context),
              mobileQrDownloadSection(context),
              mobileDownloadScreenshotSection(context),
              mobileDownloadFeatureSection(context),
              mobileDownloadReviewsSection(context),
              const MobileFooter(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
