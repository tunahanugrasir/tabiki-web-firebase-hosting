import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/providers/scroll_offset_provider.dart';
import 'package:countup/countup.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/mobile/mobile_layout_be_a_producer_hero.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/mobile/mobile_layout_be_a_timeline.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/mobile/mobile_app_bar.dart';
import '../../widgets/mobile/mobile_footer.dart';
import '../../widgets/mobile/mobile_layout_drawer.dart';

class MobileLayoutBeAProducerView extends StatefulWidget {
  const MobileLayoutBeAProducerView({super.key});

  @override
  State<MobileLayoutBeAProducerView> createState() => _MobileLayoutBeAProducerViewState();
}

class _MobileLayoutBeAProducerViewState extends State<MobileLayoutBeAProducerView> {
  late ScrollController _scrollController;
  final ScrollOffsetProvider _scrollOffsetProvider = ScrollOffsetProvider();
  final Map<String, bool> _visibleStats = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        _scrollOffsetProvider.updateScrollOffset(_scrollController.offset);
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollOffsetProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _scrollOffsetProvider,
      child: Consumer<ScrollOffsetProvider>(
        builder: (context, scrollProvider, _) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(
              kToolbarHeight,
            ),
            child: MobileAppBar(),
          ),
          drawer: const MobileDrawer(),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                mobileLayoutBeAProducerHero(context, scrollProvider),
                mobileLayoutBeAProducerTimeline(context),
                mobileLayoutBeAProducerCallToAction(context),
                const MobileFooter(
                  backgroundColor: Color(0xFFDCFCE7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mobileLayoutBeAProducerCallToAction(BuildContext context) {
    return Container(
      width: context.sized.width,
      height: context.sized.height,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF34D399).withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Üreticimiz Olun",
              style: GoogleFonts.merriweather(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF059669),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Üretici Ailemize\nKatılmaya Hazır Mısınız?",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Birlikte büyüyeceğimiz, değer üreteceğimiz ve kazanacağımız büyük ailemize siz de katılın.",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 14,
              color: const Color(0xFF065F46).withOpacity(0.8),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Image.asset(
            'assets/be_producer/family.webp',
            width: context.sized.width * 0.8,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF059669),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Ailemize Katılın',
              style: GoogleFonts.merriweather(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          _buildStatistic(
            context,
            "Toplam Üretici",
            333,
            "+",
            const Color(0xFF059669),
          ),
          _buildStatistic(
            context,
            "Toplam Satış",
            25000,
            "kg",
            const Color(0xFF059669),
          ),
          _buildStatistic(
            context,
            "Toplam Sipariş",
            3500,
            "+",
            const Color(0xFF059669),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(
    BuildContext context,
    String title,
    int endValue,
    String suffix,
    Color color,
  ) {
    return VisibilityDetector(
      key: Key('statistic-$title'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && mounted) {
          setState(() {
            _visibleStats[title] = true;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _visibleStats[title] == true
                  ? Countup(
                      begin: 0,
                      end: endValue.toDouble(),
                      duration: const Duration(seconds: 3),
                      separator: ',',
                      style: GoogleFonts.merriweather(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    )
                  : Text(
                      '0',
                      style: GoogleFonts.merriweather(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
              Text(
                suffix,
                style: GoogleFonts.merriweather(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
