import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/responsive_layout_provider.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveBuilder({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout, 
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ResponsiveLayoutProvider>(
      builder: (context, provider, child) {
        // Layout değişikliklerini dinle
        WidgetsBinding.instance.addPostFrameCallback((_) {
          provider.updateLayout(context);
        });

        switch (provider.currentLayout) {
          case LayoutType.mobile:
            return mobileLayout;
          case LayoutType.tablet:
            return tabletLayout;
          case LayoutType.desktop:
            return desktopLayout;
        }
      },
    );
  }
} 