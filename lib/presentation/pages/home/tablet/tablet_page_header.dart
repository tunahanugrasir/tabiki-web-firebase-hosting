import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TabletPageHeader extends StatelessWidget {
  const TabletPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.02,
        vertical: 8,
      ),
      child: Column(
        children: [
          _buildTopRow(context),
          _buildBottomRow(context),
        ],
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildLogo(context),
        ),
        Expanded(
          flex: 7,
          child: _buildTopNavButtons(context),
        ),
      ],
    );
  }

  Widget _buildLogo(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/logo/tabiki-appbar-logo.png',
          fit: BoxFit.cover,
          height: context.sized.height * 0.08,
        ),
      ),
    );
  }

  Widget _buildTopNavButtons(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavButton(
            context: context,
            title: "Üreticimiz Ol",
            onPressed: () => context.go('/ureticimiz-ol'),
          ),
          _buildNavButton(
            context: context,
            title: "Uygulamamızı İndir",
            onPressed: () => context.go('/uygulamamizi-indir'),
          ),
          _buildNavButton(
            context: context,
            title: "İsrafı Önleyelim",
            onPressed: () => context.go('/israfi-onleyelim'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNavButton(
          context: context,
          title: "Mağazalarımız",
          onPressed: () => context.go('/magazalarimiz'),
        ),
        const SizedBox(width: 16),
        _buildNavButton(
          context: context,
          title: "İletişim",
          onPressed: () => context.go('/iletisim'),
        ),
      ],
    );
  }


  Widget _buildNavButton({
    required BuildContext context,
    required String title,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          elevation: 0,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) => states.contains(WidgetState.pressed) ? const Color.fromRGBO(51, 110, 122, 0.1) : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.merriweather(
            fontSize: context.sized.width * 0.018,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(51, 110, 122, 1),
          ),
        ),
      ),
    );
  }
}
