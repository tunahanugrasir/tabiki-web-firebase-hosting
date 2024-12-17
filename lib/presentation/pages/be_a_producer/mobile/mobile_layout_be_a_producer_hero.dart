import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/providers/scroll_offset_provider.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/widgets/parallax_layer.dart';

Widget mobileLayoutBeAProducerHero(BuildContext context, ScrollOffsetProvider scrollProvider) {
  return Container(
    height: context.sized.height,
    width: context.sized.width,
    color: const Color(0xff96EFFF),
    child: Stack(
      fit: StackFit.expand,
      children: [
        _buildHeroContent(context),
        ..._buildParallaxLayers(scrollProvider, context),
      ],
    ),
  );
}

Widget _buildHeroContent(BuildContext context) {
  return Positioned(
    top: 0,
    right: 0,
    left: 0,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.05,
        vertical: context.sized.height * 0.05,
      ),
      child: Column(
        children: [
          SizedBox(height: context.sized.height * 0.06),
          FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              "Ürünlerinizin Değerini Siz Belirleyin!",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: context.sized.height * 0.02),
          FadeInDown(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 1200),
            child: Text(
              "Ürünlerinizi değerinin altında satmaktan bıktınız mı?\nAdil fiyatlarla, doğrudan tüketiciye ulaşarak emeğinizin gerçek karşılığını alın.",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: context.sized.height * 0.06),
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
                  fontSize: context.sized.height * 0.02,
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

List<Widget> _buildParallaxLayers(ScrollOffsetProvider scrollProvider, BuildContext context) {
  return [
    ParallaxLayer(
      scrollOffset: scrollProvider.scrollOffset,
      parallaxFactor: 0.1,
      topPosition: MediaQuery.of(context).size.height * 0.5,
      height: MediaQuery.of(context).size.height * 0.6,
      imagePath: "assets/images/layer-06.png",
    ),
    ParallaxLayer(
      scrollOffset: scrollProvider.scrollOffset,
      parallaxFactor: 0.3,
      topPosition: MediaQuery.of(context).size.height * 0.48,
      height: MediaQuery.of(context).size.height * 0.7,
      imagePath: "assets/images/layer-05.png",
    ),
    ParallaxLayer(
      scrollOffset: scrollProvider.scrollOffset,
      parallaxFactor: 0.5,
      topPosition: MediaQuery.of(context).size.height * 0.5,
      height: MediaQuery.of(context).size.height * 0.7,
      imagePath: "assets/images/layer-02.png",
    ),
    ParallaxLayer(
      scrollOffset: scrollProvider.scrollOffset,
      parallaxFactor: 0.7,
      topPosition: MediaQuery.of(context).size.height * 0.5,
      height: MediaQuery.of(context).size.height * 0.7,
      imagePath: "assets/images/layer-04.png",
    ),
    ParallaxLayer(
      scrollOffset: scrollProvider.scrollOffset,
      parallaxFactor: 0.9,
      topPosition: MediaQuery.of(context).size.height * 0.9,
      height: MediaQuery.of(context).size.height * 0.3,
      imagePath: "assets/images/layer-03.png",
    ),
  ];
}
