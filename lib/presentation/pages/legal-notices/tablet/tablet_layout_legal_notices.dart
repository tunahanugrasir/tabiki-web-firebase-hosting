import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_page_header.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_home_page_footer.dart';
import '../data/legal_notices_data.dart';
import '../models/legal_notice_model.dart';

class TabletLayoutLegalNotices extends StatefulWidget {
  const TabletLayoutLegalNotices({super.key});

  @override
  State<TabletLayoutLegalNotices> createState() => _TabletLayoutLegalNoticesState();
}

class _TabletLayoutLegalNoticesState extends State<TabletLayoutLegalNotices> {
  String selectedSection = 'Müşteri Kişisel Verilerinin Korunması Politikası';

  @override
  Widget build(BuildContext context) {
    final sectionData = LegalNoticesData.sections[selectedSection];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sized.width * 0.1,
                vertical: context.sized.height * 0.05,
              ),
              child: const DesktopPageHeader(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: Row(
                children: [
                  _buildSideMenu(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (sectionData != null) ...sectionData.notices.map((notice) => _buildSection(notice)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TabletHomePageFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSideMenu() {
    return Container(
      width: 300,
      color: const Color(0xFFF0FDF4),
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yasal Bildirimler',
              style: GoogleFonts.merriweather(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF166534),
              ),
            ),
            const SizedBox(height: 32),
            ...LegalNoticesData.sections.keys.map(
              (section) => _buildMenuItem(
                section,
                isSelected: selectedSection == section,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedSection = title;
          });
        },
        child: Text(
          title,
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: isSelected ? const Color(0xFF166534) : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSection(LegalNoticeModel notice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notice.title,
          style: GoogleFonts.merriweather(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF166534),
          ),
        ),
        const SizedBox(height: 16),
        ...notice.content.map((content) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                content,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            )),
        const SizedBox(height: 32),
      ],
    );
  }
}
