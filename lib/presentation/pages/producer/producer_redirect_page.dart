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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleRedirect();
    });
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
          final deepLink = Uri.parse('tabiki://producer/${widget.producerId}');
          await _tryLaunchDeepLink(deepLink, appStoreUrl);
        } else if (userAgent.contains('android')) {
          // Chrome için özel yönlendirme
          html.window.location.href = 'tabiki://producer/${widget.producerId}';

          // 2 saniye sonra Play Store'a yönlendir
          await Future.delayed(const Duration(seconds: 2));
          if (mounted) {
            await launchUrl(
              Uri.parse(playStoreUrl),
              mode: LaunchMode.externalApplication,
            );
          }
        } else {
          await launchUrl(
            Uri.parse(playStoreUrl),
            mode: LaunchMode.externalApplication,
          );
        }
      } catch (e) {
        if (mounted) {
          final storeUrl = (userAgent.contains('iphone') || userAgent.contains('ipad')) ? appStoreUrl : playStoreUrl;
          await launchUrl(
            Uri.parse(storeUrl),
            mode: LaunchMode.externalApplication,
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isRedirecting = false);
        }
      }
    }
  }

  Future<void> _tryLaunchDeepLink(Uri deepLink, String storeUrl) async {
    try {
      final launched = await launchUrl(
        deepLink,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && mounted) {
        await launchUrl(
          Uri.parse(storeUrl),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      if (mounted) {
        await launchUrl(
          Uri.parse(storeUrl),
          mode: LaunchMode.externalApplication,
        );
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
    );
  }
}
