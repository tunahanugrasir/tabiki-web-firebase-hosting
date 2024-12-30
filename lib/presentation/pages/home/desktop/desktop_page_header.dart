import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class DesktopPageHeader extends StatelessWidget {
  const DesktopPageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: context.sized.width,
        maxHeight: context.sized.height * 0.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => context.go('/'),
              child: Image.asset(
                'assets/logo/tabiki-appbar-logo.png',
                fit: BoxFit.cover,
                height: context.sized.height * 0.1,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildHeaderButton(
                    "Üreticimiz Ol",
                    () => context.go('/ureticimiz-ol'),
                  ),
                  _buildHeaderButton(
                    "Uygulamamızı İndir",
                    () => context.go('/uygulamamizi-indir'),
                  ),
                  _buildHeaderButton(
                    "İsrafı Önleyelim",
                    () => context.go('/israfi-onleyelim'),
                  ),
                  _buildHeaderButton(
                    "Mağazalarımız",
                    () => context.go('/magazalarimiz'),
                  ),
                  _buildHeaderButton(
                    "İletişim",
                    () => context.go('/iletisim'),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(51, 110, 122, 1),
        surfaceTintColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: GoogleFonts.merriweather(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(51, 110, 122, 1),
        ),
      ),
    );
  }
}
