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
  static const String webUrl = 'https://tabiki.co';
  bool _isRedirecting = false;
  bool _hasAttemptedRedirect = false;

  @override
  void initState() {
    super.initState();
    _handleRedirect();
  }

  Future<void> _handleRedirect() async {
    if (kIsWeb && !_hasAttemptedRedirect) {
      setState(() {
        _isRedirecting = true;
        _hasAttemptedRedirect = true;
      });

      final userAgent = html.window.navigator.userAgent.toLowerCase();

      try {
        if (userAgent.contains('iphone') || userAgent.contains('ipad')) {
          // iOS için Universal Link
          final universalLink = Uri.parse('$webUrl/producer/${widget.producerId}');
          // Eğer Universal Link çalışmazsa, Custom URL Scheme'e geri dön
          final deepLink = Uri.parse('tabiki://producer/${widget.producerId}');

          await _tryLaunchUniversalLink(universalLink, deepLink, appStoreUrl);
        } else if (userAgent.contains('android')) {
          // Android için Intent URL kullan
          final intentUrl = 'intent://producer/${widget.producerId}#Intent;'
              'scheme=tabiki;'
              'package=co.tabiki.app;'
              'S.browser_fallback_url=${Uri.encodeComponent(playStoreUrl)};'
              'end';

          await _launchAndroidIntent(intentUrl, playStoreUrl);
        } else {
          await launchUrl(Uri.parse(playStoreUrl));
        }
      } catch (e) {
        if (mounted) {
          final storeUrl = (userAgent.contains('iphone') || userAgent.contains('ipad')) ? appStoreUrl : playStoreUrl;
          await launchUrl(Uri.parse(storeUrl));
        }
      } finally {
        if (mounted) {
          setState(() => _isRedirecting = false);
        }
      }
    }
  }

  Future<void> _launchAndroidIntent(String intentUrl, String fallbackUrl) async {
    try {
      // Intent URL'i aç
      final uri = Uri.parse(intentUrl);
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      // Eğer açılamazsa Play Store'a yönlendir
      if (!launched && mounted) {
        await launchUrl(Uri.parse(fallbackUrl));
      }
    } catch (e) {
      if (mounted) {
        await launchUrl(Uri.parse(fallbackUrl));
      }
    }
  }

  Future<void> _tryLaunchUniversalLink(Uri universalLink, Uri deepLink, String storeUrl) async {
    try {
      // Önce Universal Link'i dene
      final launched = await launchUrl(
        universalLink,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && mounted) {
        // Universal Link çalışmadıysa, deep link'i dene
        final canLaunchDeepLink = await canLaunchUrl(deepLink);
        if (canLaunchDeepLink) {
          final deepLinkLaunched = await launchUrl(
            deepLink,
            mode: LaunchMode.externalApplication,
          );

          if (!deepLinkLaunched && mounted) {
            await launchUrl(Uri.parse(storeUrl));
          }
        } else if (mounted) {
          await launchUrl(Uri.parse(storeUrl));
        }
      }
    } catch (e) {
      if (mounted) {
        await launchUrl(Uri.parse(storeUrl));
      }
    }
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
