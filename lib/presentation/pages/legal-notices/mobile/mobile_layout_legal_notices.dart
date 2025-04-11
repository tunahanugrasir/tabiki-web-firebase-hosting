import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_footer.dart';
import '../data/legal_notices_data.dart';
import '../models/legal_notice_model.dart';

class MobileLayoutLegalNotices extends StatefulWidget {
  const MobileLayoutLegalNotices({super.key});

  @override
  State<MobileLayoutLegalNotices> createState() =>
      _MobileLayoutLegalNoticesState();
}

class _MobileLayoutLegalNoticesState extends State<MobileLayoutLegalNotices> {
  String selectedSection = 'Müşteri Kişisel Verilerinin Korunması Politikası';

  @override
  Widget build(BuildContext context) {
    final sectionData = LegalNoticesData.sections[selectedSection];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Yasal Bildirimler',
          style: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF166534),
          ),
        ),
      ),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (sectionData != null)
              ...sectionData.notices.map((notice) => _buildSection(notice)),
            const MobileFooter(backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: const Color(0xFFF0FDF4),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF166534),
              ),
              child: Text(
                'Yasal Bildirimler',
                style: GoogleFonts.merriweather(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ...LegalNoticesData.sections.keys.map(
              (section) => _buildDrawerItem(section),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    final isSelected = selectedSection == title;

    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.merriweather(
          fontSize: 14,
          color: isSelected ? const Color(0xFF166534) : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0xFFDCFCE7),
      onTap: () {
        setState(() {
          selectedSection = title;
        });
        Navigator.pop(context); // Drawer'ı kapat
      },
    );
  }

  Widget _buildSection(LegalNoticeModel notice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notice.title,
          style: GoogleFonts.merriweather(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF166534),
          ),
        ),
        const SizedBox(height: 12),
        ...notice.content.map((content) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                content,
                style: GoogleFonts.merriweather(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            )),
        const SizedBox(height: 24),
      ],
    );
  }
}
