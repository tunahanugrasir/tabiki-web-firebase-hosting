import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_page_header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:panorama/panorama.dart';

class DesktopStoresPage extends StatefulWidget {
  const DesktopStoresPage({super.key});

  @override
  State<DesktopStoresPage> createState() => _DesktopStoresPageState();
}

class _DesktopStoresPageState extends State<DesktopStoresPage> {
  final List<Map<String, dynamic>> _stores = [
    {
      'name': 'tabiki Fethiye',
      'address': 'Cumhuriyet, 500. Sk., 48300 Fethiye/Muğla',
      'phone': '+90 (216) 123 45 67',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-fethiye.webp',
      'panorama': 'assets/stores/panorama-fethiye.png',
      'location': 'https://maps.google.com/?q=36.623524, 29.114460',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi'],
      'reviews': [
        {
          'name': 'Ahmet K.',
          'rating': 5,
          'comment': 'Ürünler çok taze ve personel çok ilgili. Kesinlikle tavsiye ederim.',
          'date': '2024-02-15',
        },
        {
          'name': 'Ayşe M.',
          'rating': 4,
          'comment': 'Mağaza ferah ve temiz. Ürün çeşitliliği gayet iyi.',
          'date': '2024-02-10',
        },
      ],
    },
    {
      'name': 'tabiki Bodrum',
      'address': 'Eskiçeşme, Neyzen Tevfik Cd. No:170, 48400 Bodrum/Muğla',
      'phone': '+90 (212) 345 67 89',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-gocek.webp',
      'panorama': 'assets/stores/panorama-gocek.webp',
      'location': 'https://maps.google.com/?q=37.034710, 27.421923',
      'features': ['Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
      'reviews': [
        {
          'name': 'Mehmet Y.',
          'rating': 5,
          'comment': 'Çocuk oyun alanı süper! Alışveriş yaparken çocuklar sıkılmıyor.',
          'date': '2024-02-14',
        },
        {
          'name': 'Zeynep S.',
          'rating': 5,
          'comment': 'Cafe kısmı çok güzel, ürünler her zaman taze.',
          'date': '2024-02-12',
        },
      ],
    },
    {
      'name': 'tabiki Marmaris',
      'address': 'Kemeraltı, Atatürk Cd. No:26, 48700 Marmaris/Muğla',
      'phone': '+90 (212) 567 89 01',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-marmaris.webp',
      'panorama': 'assets/stores/panorama-marmaris.png',
      'location': 'https://maps.google.com/?q=36.851947, 28.266181',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
      'reviews': [
        {
          'name': 'Ali R.',
          'rating': 4,
          'comment': 'Otopark olması büyük avantaj. Ürünler kaliteli.',
          'date': '2024-02-13',
        },
        {
          'name': 'Fatma K.',
          'rating': 5,
          'comment': 'Mağaza çok geniş ve ferah. Personel yardımsever.',
          'date': '2024-02-11',
        },
      ],
    },
    {
      'name': 'tabiki Köyceğiz',
      'address': 'Ulucami, Cengiz Topel Cd. No:58/B, 48800 Köyceğiz/Muğla',
      'phone': '+90 (212) 567 89 01',
      'workingHours': '09:00 - 22:00',
      'image': 'assets/stores/tabiki-koycegız.webp',
      'panorama': 'assets/stores/panorama-koycegız.png',
      'location': 'https://maps.google.com/?q=36.958155, 28.682517',
      'features': ['Ücretsiz Otopark', 'Cafe', 'Engelli Erişimi', 'Çocuk Oyun Alanı'],
      'reviews': [
        {
          'name': 'Ali R.',
          'rating': 4,
          'comment': 'Otopark olması büyük avantaj. Ürünler kaliteli.',
          'date': '2024-02-13',
        },
        {
          'name': 'Fatma K.',
          'rating': 5,
          'comment': 'Mağaza çok geniş ve ferah. Personel yardımsever.',
          'date': '2024-02-11',
        },
      ],
    },
  ];

  int _selectedStoreIndex = 0;
  double _panoramaLongitude = 0;
  double _panoramaLatitude = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.width * 0.1,
                  vertical: context.sized.height * 0.05,
                ),
                child: const DesktopPageHeader(),
              ),
              _buildHeroSection(context),
              _buildStoresSection(context),
              _buildStoreDetailsSection(context),
              const HomePageFooter(
                backgroundColor: Colors.white,
              )
              // _build360Section(context),
              // _buildReviewsSection(context),
              // _buildContactSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: context.sized.height * 0.4,
      width: context.sized.width,
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF34D399).withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Mağazalarımız",
              style: GoogleFonts.merriweather(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF059669),
              ),
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(),
          const SizedBox(height: 24),
          Text(
            "Size En Yakın tabiki\nMağazasını Keşfedin",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
              height: 1.2,
            ),
          ).animate().fadeIn(delay: 200.ms).slideX(),
          const SizedBox(height: 24),
          Text(
            "Taze ve doğal ürünlerimizi mağazalarımızda da bulabilirsiniz.",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 18,
              color: const Color(0xFF065F46).withOpacity(0.8),
              height: 1.6,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(),
        ],
      ),
    );
  }

  Widget _buildStoresSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
        vertical: 80,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mağazalarımız",
                  style: GoogleFonts.merriweather(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF065F46),
                  ),
                ),
                const SizedBox(height: 32),
                ...List.generate(
                  _stores.length,
                  (index) => _buildStoreCard(context, index),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 800,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  _stores[_selectedStoreIndex]['image'],
                  height: 800,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ).animate().scale(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreCard(BuildContext context, int index) {
    final store = _stores[index];
    final isSelected = _selectedStoreIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedStoreIndex = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF059669) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              store['name'],
              style: GoogleFonts.merriweather(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF065F46),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              store['address'],
              style: GoogleFonts.merriweather(
                fontSize: 16,
                color: isSelected ? Colors.white.withOpacity(0.8) : const Color(0xFF065F46).withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 20,
                  color: isSelected ? Colors.white : const Color(0xFF059669),
                ),
                const SizedBox(width: 8),
                Text(
                  store['workingHours'],
                  style: GoogleFonts.merriweather(
                    fontSize: 16,
                    color: isSelected ? Colors.white : const Color(0xFF065F46),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).animate().scale(),
    );
  }

  Widget _buildStoreDetailsSection(BuildContext context) {
    final selectedStore = _stores[_selectedStoreIndex];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
        vertical: 80,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "Mağaza Detayları",
            style: GoogleFonts.merriweather(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailCard(
                context,
                Icons.location_on_rounded,
                "Adres",
                selectedStore['address'],
                onTap: () => _launchURL(selectedStore['location']),
              ),
              _buildDetailCard(
                context,
                Icons.phone_rounded,
                "Telefon",
                selectedStore['phone'],
                onTap: () => _launchURL('tel:${selectedStore['phone']}'),
              ),
              _buildDetailCard(
                context,
                Icons.access_time_rounded,
                "Çalışma Saatleri",
                selectedStore['workingHours'],
              ),
            ],
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            children: selectedStore['features'].map<Widget>((feature) {
              return Chip(
                label: Text(
                  feature,
                  style: GoogleFonts.merriweather(
                    color: const Color(0xFF065F46),
                  ),
                ),
                backgroundColor: const Color(0xFF34D399).withOpacity(0.1),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(
    BuildContext context,
    IconData icon,
    String title,
    String content, {
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.sized.width * 0.25,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 48,
                color: const Color(0xFF059669),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.merriweather(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  color: const Color(0xFF065F46).withOpacity(0.8),
                ),
              ),
              if (onTap != null) ...[
                const SizedBox(height: 16),
                Text(
                  "Tıklayın",
                  style: GoogleFonts.merriweather(
                    fontSize: 14,
                    color: const Color(0xFF059669),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ).animate().scale();
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "Bize Ulaşın",
            style: GoogleFonts.merriweather(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Sorularınız için bize ulaşabilirsiniz",
            style: GoogleFonts.merriweather(
              fontSize: 18,
              color: const Color(0xFF065F46).withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactButton(
                context,
                Icons.phone_rounded,
                "Bizi Arayın",
                () => _launchURL('tel:+902121234567'),
              ),
              const SizedBox(width: 24),
              _buildContactButton(
                context,
                Icons.mail_rounded,
                "E-posta Gönderin",
                () => _launchURL('mailto:info@tabiki.com'),
              ),
              const SizedBox(width: 24),
              _buildContactButton(
                context,
                Icons.phone_android_rounded,
                "WhatsApp",
                () => _launchURL('https://wa.me/902121234567'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF059669),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF059669).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                text,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().scale();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Widget _build360Section(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "Mağazamızı 360° Keşfedin",
            style: GoogleFonts.merriweather(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Mağazamızı sanal olarak gezebilir, bölümleri inceleyebilirsiniz",
            style: GoogleFonts.merriweather(
              fontSize: 18,
              color: const Color(0xFF065F46).withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 48),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 500,
              child: Panorama(
                longitude: _panoramaLongitude,
                latitude: _panoramaLatitude,
                onViewChanged: (longitude, latitude, _) {
                  setState(() {
                    _panoramaLongitude = longitude;
                    _panoramaLatitude = latitude;
                  });
                },
                child: Image.asset(
                  _stores[_selectedStoreIndex]['panorama'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context) {
    final reviews = _stores[_selectedStoreIndex]['reviews'] as List;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sized.width * 0.1,
        vertical: 80,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "Müşteri Yorumları",
            style: GoogleFonts.merriweather(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            children: reviews.map<Widget>((review) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildReviewCard(context, review),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, Map<String, dynamic> review) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review['name'],
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < review['rating'] ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFBBF24),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            review['comment'],
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withOpacity(0.8),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            review['date'],
            style: GoogleFonts.merriweather(
              fontSize: 14,
              color: const Color(0xFF065F46).withOpacity(0.6),
            ),
          ),
        ],
      ),
    ).animate().scale();
  }
}
