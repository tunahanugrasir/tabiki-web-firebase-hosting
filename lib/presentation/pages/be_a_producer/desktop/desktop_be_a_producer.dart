import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_page_header.dart';
import 'package:countup/countup.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:animate_do/animate_do.dart';

import 'constants/timeline_constants.dart';
import 'providers/scroll_offset_provider.dart';
import 'widgets/parallax_layer.dart';
import 'widgets/timeline_step.dart';

class DesktopLayoutBeAProducer extends StatefulWidget {
  const DesktopLayoutBeAProducer({super.key});

  @override
  State<DesktopLayoutBeAProducer> createState() => _DesktopLayoutBeAProducerState();
}

class _DesktopLayoutBeAProducerState extends State<DesktopLayoutBeAProducer> {
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
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildHeroSection(context, scrollProvider),
                _buildTimelineSection(context),
                _buildCallToAction(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, ScrollOffsetProvider scrollProvider) {
    return Container(
      height: context.sized.height,
      width: context.sized.width,
      color: const Color(0xff96EFFF),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildHeroContent(),
          ..._buildParallaxLayers(scrollProvider),
        ],
      ),
    );
  }

  Widget _buildHeroContent() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.width * 0.1,
          vertical: context.sized.height * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.sized.height * 0.1,
              width: context.sized.width,
              child: const DesktopPageHeader(),
            ),
            const SizedBox(height: 40),
            FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: Text(
                "Ürünlerinizin Değerini Siz Belirleyin!",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 48),
            FadeInDown(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 1200),
              child: Text(
                "Ürünlerinizi değerinin altında satmaktan bıktınız mı?\nAdil fiyatlarla, doğrudan tüketiciye ulaşarak emeğinizin gerçek karşılığını alın.",
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 48),
            FadeInUp(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 1200),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(51, 110, 122, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Üreticimiz Ol',
                  style: GoogleFonts.merriweather(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildParallaxLayers(ScrollOffsetProvider scrollProvider) {
    return [
      ParallaxLayer(
        scrollOffset: scrollProvider.scrollOffset,
        parallaxFactor: 0.1,
        topPosition: context.sized.height * 0.5,
        height: context.sized.height * 0.6,
        imagePath: "assets/images/layer-06.png",
      ),
      ParallaxLayer(
        scrollOffset: scrollProvider.scrollOffset,
        parallaxFactor: 0.3,
        topPosition: context.sized.height * 0.48,
        height: context.sized.height * 0.7,
        imagePath: "assets/images/layer-05.png",
      ),
      ParallaxLayer(
        scrollOffset: scrollProvider.scrollOffset,
        parallaxFactor: 0.5,
        topPosition: context.sized.height * 0.5,
        height: context.sized.height * 0.7,
        imagePath: "assets/images/layer-02.png",
      ),
      ParallaxLayer(
        scrollOffset: scrollProvider.scrollOffset,
        parallaxFactor: 0.7,
        topPosition: context.sized.height * 0.5,
        height: context.sized.height * 0.7,
        imagePath: "assets/images/layer-04.png",
      ),
      ParallaxLayer(
        scrollOffset: scrollProvider.scrollOffset,
        parallaxFactor: 0.9,
        topPosition: context.sized.height * 0.9,
        height: context.sized.height * 0.3,
        imagePath: "assets/images/layer-03.png",
      ),
    ];
  }

  Widget _buildTimelineSection(BuildContext context) {
    return Container(
      width: context.sized.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            TimelineColors.backgroundColor,
            TimelineColors.backgroundEndColor,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.width * 0.1,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              "Nasıl Üretici Olunur?",
              style: GoogleFonts.merriweather(
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: TimelineColors.textColor,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.sized.height * 0.05),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.sized.width * 0.8,
              ),
              child: const Column(
                children: [
                  TimelineStep(
                    icon: Icons.app_registration_rounded,
                    title: "Uygulamamızı İndirin",
                    description: "Uygulamamızı indirin ve üretici olarak kayıt olun",
                    stepNumber: "1",
                    gradientColors: TimelineColors.step1Colors,
                    imagePath: "assets/be_producer/register.webp",
                    isLeft: true,
                  ),
                  TimelineStep(
                    icon: Icons.inventory_2_rounded,
                    title: "Ürünlerinizi Ekleyin",
                    description: "Ürünlerinizi kolayca sisteme ekleyin",
                    stepNumber: "2",
                    gradientColors: TimelineColors.step2Colors,
                    imagePath: "assets/be_producer/product.webp",
                    isLeft: false,
                  ),
                  TimelineStep(
                    icon: Icons.people_rounded,
                    title: "Hazırlığınızı Yapın",
                    description: "Ürünlerinizi ekip arkadaşlarımız gelene kadar hazırlayın",
                    stepNumber: "3",
                    gradientColors: TimelineColors.step3Colors,
                    imagePath: "assets/be_producer/team.webp",
                    isLeft: true,
                  ),
                  TimelineStep(
                    icon: Icons.local_shipping_rounded,
                    title: "Siparişleri Takip Edin",
                    description: "Ürünler bize ulaştıktan sonra gerisini bize bırakın ve siparişlerinizin bildirimini keyifle dinleyin",
                    stepNumber: "4",
                    gradientColors: TimelineColors.step4Colors,
                    imagePath: "assets/be_producer/order.webp",
                    isLeft: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context) {
    return Container(
      height: context.sized.height * 2,
      width: context.sized.width,
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
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Dekoratif elementler
                Positioned(
                  right: -80,
                  top: 0,
                  child: Container(
                    width: context.sized.width * 0.15,
                    height: context.sized.width * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF34D399).withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Positioned(
                  right: -40,
                  bottom: -300,
                  child: Container(
                    width: context.sized.width * 0.20,
                    height: context.sized.width * 0.20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF34D399).withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Positioned(
                  left: -30,
                  bottom: -30,
                  child: Container(
                    width: context.sized.width * 0.1,
                    height: context.sized.width * 0.1,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF34D399).withValues(alpha: 0.1),
                    ),
                  ),
                ),
                // İçerik
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sized.width * 0.1,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Sol taraf - Metin içeriği
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF34D399).withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Üreticimiz Olun",
                                      style: GoogleFonts.merriweather(
                                        fontSize: context.sized.width * 0.012,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF059669),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: context.sized.height * 0.03),
                                  Text(
                                    "Üretici Ailemize\nKatılmaya Hazır Mısınız?",
                                    style: GoogleFonts.merriweather(
                                      fontSize: context.sized.width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF065F46),
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: context.sized.height * 0.03),
                                  Text(
                                    "Birlikte büyüyeceğimiz, değer üreteceğimiz ve kazanacağımız büyük ailemize siz de katılın. Ürünlerinizi değerinde satmanın mutluluğunu yaşayın.",
                                    style: GoogleFonts.merriweather(
                                      fontSize: context.sized.width * 0.013,
                                      color: const Color(0xFF065F46).withValues(alpha: 0.8),
                                      height: 1.6,
                                    ),
                                  ),
                                  SizedBox(height: context.sized.height * 0.05),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: TweenAnimationBuilder<double>(
                                      duration: TimelineConstants.animationDuration,
                                      curve: TimelineConstants.animationCurve,
                                      tween: Tween<double>(begin: 1, end: 1),
                                      builder: (context, scale, child) => Transform.scale(
                                        scale: scale,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF059669),
                                                Color(0xFF047857),
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xFF059669).withValues(alpha: 0.3),
                                                blurRadius: 20,
                                                offset: const Offset(0, 10),
                                              ),
                                            ],
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              foregroundColor: Colors.white,
                                              elevation: 0,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: context.sized.width * 0.025,
                                                vertical: context.sized.height * 0.025,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Ailemize Katılın',
                                                  style: GoogleFonts.merriweather(
                                                    fontSize: context.sized.width * 0.013,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: context.sized.width * 0.008),
                                                Icon(
                                                  Icons.arrow_forward_rounded,
                                                  color: Colors.white,
                                                  size: context.sized.width * 0.015,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Sağ taraf - Görsel
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(context.sized.width * 0.03),
                                child: Image.asset(
                                  'assets/be_producer/family.webp',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // İstatistikler
                      Container(
                        padding: EdgeInsets.symmetric(vertical: context.sized.height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatistic(
                              context,
                              "Toplam Üretici",
                              333,
                              "+",
                              const Color(0xFF059669),
                            ),
                            Container(
                              width: 2,
                              height: 100,
                              color: const Color(0xFF059669).withValues(alpha: 0.2),
                            ),
                            _buildStatistic(
                              context,
                              "Toplam Satış",
                              25000,
                              "kg",
                              const Color(0xFF059669),
                            ),
                            Container(
                              width: 2,
                              height: 100,
                              color: const Color(0xFF059669).withValues(alpha: 0.2),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: HomePageFooter(
            backgroundColor: const Color(0xFF34D399).withValues(alpha: 0.1),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF0FDF4),
                Color(0xFFDCFCE7),
              ],
            ),
          ))
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _visibleStats[title] == true
                  ? Countup(
                      begin: 0,
                      end: endValue.toDouble(),
                      duration: const Duration(seconds: 3),
                      separator: ',',
                      style: GoogleFonts.merriweather(
                        fontSize: context.sized.width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    )
                  : Text(
                      '0',
                      style: GoogleFonts.merriweather(
                        fontSize: context.sized.width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
              Text(
                suffix,
                style: GoogleFonts.merriweather(
                  fontSize: context.sized.width * 0.025,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: context.sized.height * 0.02),
          Text(
            title,
            style: GoogleFonts.merriweather(
              fontSize: context.sized.width * 0.012,
              color: color.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
