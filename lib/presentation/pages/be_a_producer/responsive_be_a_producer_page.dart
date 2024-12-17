import 'package:flutter/material.dart';
import '../../../core/widgets/responsive_builder.dart';
import 'desktop/desktop_be_a_producer.dart';
import 'mobile/mobile_layout_be_a_producer_view.dart';
import 'tablet/tablet_layout_be_a_producer_view.dart';

class ResponsiveBeAProducerPage extends StatelessWidget {
  const ResponsiveBeAProducerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobileLayout: MobileLayoutBeAProducerView(),
      tabletLayout: TabletLayoutBeAProducerView(),
      desktopLayout: DesktopLayoutBeAProducer(),
    );
  }
}
