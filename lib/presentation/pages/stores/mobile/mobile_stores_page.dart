import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_app_bar.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_layout_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileStoresPage extends StatefulWidget {
  const MobileStoresPage({super.key});

  @override
  State<MobileStoresPage> createState() => _MobileStoresPageState();
}

class _MobileStoresPageState extends State<MobileStoresPage> {
  final List<Map<String, dynamic>> _stores = [
    {
      'name': 'tabiki Fethiye',
      'address': 'Cumhuriyet, 500. Sk., 48300 Fethiye/Muğla',
      'phone': '+90 (530) 697 89 70',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-fethiye.webp',
      'location': 'https://maps.google.com/?q=36.623524, 29.114460',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi'],
    },
    {
      'name': 'tabiki Bodrum',
      'address': 'Eskiçeşme, Neyzen Tevfik Cd. No:170, 48400 Bodrum/Muğla',
      'phone': '+90 (530) 697 89 70',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-gocek.webp',
      'location': 'https://maps.google.com/?q=37.034710, 27.421923',
      'features': ['Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
    },
    {
      'name': 'tabiki Marmaris',
      'address': 'Kemeraltı, Atatürk Cd. No:26, 48700 Marmaris/Muğla',
      'phone': '+90 (530) 697 89 70',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-marmaris.webp',
      'location': 'https://maps.google.com/?q=36.851947, 28.266181',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
    },
    {
      'name': 'tabiki Köyceğiz',
      'address': 'Ulucami, Cengiz Topel Cd. No:58/B, 48800 Köyceğiz/Muğla',
      'phone': '+90 (530) 697 89 70',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-koycegız.webp',
      'location': 'https://maps.google.com/?q=36.958155, 28.682517',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
    },
  ];

  int _selectedStoreIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MobileDrawer(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MobileAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildStoresList(context),
            _buildStoreDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF0FDF4), Color(0xFFDCFCE7)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF34D399).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Mağazalarımız",
              style: GoogleFonts.merriweather(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF059669),
              ),
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 16),
          Text(
            "Size En Yakın tabiki\nMağazasını Keşfedin",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
              height: 1.2,
            ),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 16),
          Text(
            "Taze ve doğal ürünlerimizi mağazalarımızda da bulabilirsiniz.",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withValues(alpha: 0.8),
            ),
          ).animate().fadeIn(delay: 400.ms),
        ],
      ),
    );
  }

  Widget _buildStoresList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: _stores.length,
      itemBuilder: (context, index) => _buildStoreCard(context, index),
    );
  }

  Widget _buildStoreCard(BuildContext context, int index) {
    final store = _stores[index];
    final isSelected = _selectedStoreIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedStoreIndex = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF059669) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                store['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              store['name'],
              style: GoogleFonts.merriweather(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF065F46),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              store['address'],
              style: GoogleFonts.merriweather(
                fontSize: 14,
                color: isSelected ? Colors.white.withValues(alpha: 0.8) : const Color(0xFF065F46).withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 16),
            _buildStoreActions(context, store, isSelected),
          ],
        ),
      ),
    ).animate().fadeIn();
  }

  Widget _buildStoreActions(BuildContext context, Map<String, dynamic> store, bool isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          context,
          Icons.location_on_outlined,
          'Yol Tarifi',
          () => _launchURL(store['location']),
          isSelected,
        ),
        _buildActionButton(
          context,
          Icons.phone_outlined,
          'Ara',
          () => _launchURL('tel:${store['phone']}'),
          isSelected,
        ),
        _buildActionButton(
          context,
          Icons.access_time_outlined,
          store['workingHours'],
          null,
          isSelected,
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback? onTap,
    bool isSelected,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : const Color(0xFF059669),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.merriweather(
              fontSize: 12,
              color: isSelected ? Colors.white : const Color(0xFF065F46),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreDetails(BuildContext context) {
    final store = _stores[_selectedStoreIndex];
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mağaza Özellikleri',
            style: GoogleFonts.merriweather(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (store['features'] as List<String>).map((feature) {
              return Chip(
                label: Text(
                  feature,
                  style: GoogleFonts.merriweather(
                    fontSize: 12,
                    color: const Color(0xFF065F46),
                  ),
                ),
                backgroundColor: const Color(0xFF34D399).withValues(alpha: 0.1),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
