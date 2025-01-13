import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProducerRedirectPage extends StatefulWidget {
  const ProducerRedirectPage({
    required this.producerId,
    super.key,
  });

  final String producerId;

  @override
  State<ProducerRedirectPage> createState() => _ProducerRedirectPageState();
}

class _ProducerRedirectPageState extends State<ProducerRedirectPage> {
  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=co.tabiki.app';
  static const String appStoreUrl = 'https://apps.apple.com/app/tabiki/id123456789';
  bool _isRedirecting = false;

  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }

  Future<void> _handleRedirect() async {
    if (kIsWeb) {
      final deepLink = 'tabiki://producer/${widget.producerId}';
      final userAgent = html.window.navigator.userAgent.toLowerCase();

      setState(() => _isRedirecting = true);

      if (userAgent.contains('iphone') || userAgent.contains('ipad')) {
        _redirectToStore(deepLink, appStoreUrl);
      } else if (userAgent.contains('android')) {
        _redirectToStore(deepLink, playStoreUrl);
      } else {
        launchUrl(Uri.parse(playStoreUrl));
      }
    }
  }

  void _redirectToStore(String deepLink, String storeUrl) {
    // Önce deep link'i dene
    final startTime = DateTime.now();
    bool hasRedirected = false;

    // Deep link'i aç
    html.window.location.href = deepLink;

    // 2 saniye bekle ve kontrol et
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (!hasRedirected) {
        // Eğer sayfa hala açıksa (uygulama açılmadıysa), mağazaya yönlendir
        final currentTime = DateTime.now();
        if (currentTime.difference(startTime).inMilliseconds >= 1900) {
          hasRedirected = true;
          html.window.location.href = storeUrl;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/tabiki-appbar-logo.png',
              width: 120,
            ),
            const SizedBox(height: 24),
            if (_isRedirecting) ...[
              const CircularProgressIndicator(
                color: Colors.green,
              ),
              const SizedBox(height: 24),
              const Text(
                'Tabiki uygulamasına yönlendiriliyorsunuz...',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
            if (!_isRedirecting) ...[
              const Text(
                'Tabiki\'de Alışveriş Zamanı!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Üreticinin ürünlerini görmek için Tabiki uygulamasını indirin.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => launchUrl(Uri.parse(playStoreUrl)),
                    icon: const Icon(Icons.android),
                    label: const Text('Google Play\'den İndir'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => launchUrl(Uri.parse(appStoreUrl)),
                    icon: const Icon(Icons.apple),
                    label: const Text('App Store\'dan İndir'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
