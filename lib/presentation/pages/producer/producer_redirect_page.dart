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
  bool _isAndroid = false;
  bool _isIOS = false;

  @override
  void initState() {
    super.initState();
    _detectPlatform();
  }

  void _detectPlatform() {
    if (kIsWeb) {
      final userAgent = html.window.navigator.userAgent.toLowerCase();
      setState(() {
        _isAndroid = userAgent.contains('android');
        _isIOS = userAgent.contains('iphone') || userAgent.contains('ipad');
      });
    }
  }

  Future<void> _openApp() async {
    final deepLink = 'tabiki://producer/${widget.producerId}';

    try {
      if (_isIOS) {
        await launchUrl(
          Uri.parse(deepLink),
          mode: LaunchMode.externalApplication,
        );
      } else if (_isAndroid) {
        // Android için Intent URL
        final intentUrl = 'intent://producer/${widget.producerId}#Intent;'
            'scheme=tabiki;'
            'package=co.tabiki.app;'
            'end';

        await launchUrl(
          Uri.parse(intentUrl),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      // Hata durumunda mağazaya yönlendir
      _openStore();
    }
  }

  Future<void> _openStore() async {
    final storeUrl = _isIOS ? appStoreUrl : playStoreUrl;
    await launchUrl(
      Uri.parse(storeUrl),
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/tabiki-appbar-logo.png',
                width: 120,
              ),
              const SizedBox(height: 32),
              const Text(
                'Tabiki\'de Alışveriş Zamanı!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Üreticinin ürünlerini görmek için Tabiki uygulamasını kullanın.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 48),
              if (_isAndroid || _isIOS) ...[
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _openApp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    icon: Icon(_isAndroid ? Icons.android : Icons.apple),
                    label: const Text(
                      'Uygulamayı Aç',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _openStore,
                  child: const Text(
                    'Uygulama yüklü değil mi? Mağazadan indir',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ] else ...[
                const Text(
                  'Tabiki uygulamasını mobil cihazınıza indirerek üreticilerin ürünlerine göz atabilirsiniz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse(playStoreUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                      icon: const Icon(Icons.android),
                      label: const Text('Google Play\'den İndir'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse(appStoreUrl),
                        mode: LaunchMode.externalApplication,
                      ),
                      icon: const Icon(Icons.apple),
                      label: const Text('App Store\'dan İndir'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
