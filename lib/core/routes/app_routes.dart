import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/responsive_be_a_producer_page.dart';
import 'package:tabiki_web/presentation/pages/contact/responsive_contact_page.dart';
import 'package:tabiki_web/presentation/pages/download_the_app/responsive_download_the_app_page.dart';
import 'package:tabiki_web/presentation/pages/home/responsive_home_page.dart';
import 'package:tabiki_web/presentation/pages/israf/responsive_layout_israf_page.dart';
import 'package:tabiki_web/presentation/pages/legal-notices/responsive_layout_legal_notices.dart';
import 'package:tabiki_web/presentation/pages/producer/producer_redirect_page.dart';
import 'package:tabiki_web/presentation/pages/stores/responsive_stores_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const ResponsiveHomePage(),
    ),
    GoRoute(
      path: '/producer/:id',
      name: 'producer',
      builder: (context, state) => ProducerRedirectPage(
        producerId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/ureticimiz-ol',
      name: 'be_producer',
      builder: (context, state) => const ResponsiveBeAProducerPage(),
    ),
    GoRoute(
      path: '/uygulamamizi-indir',
      name: 'download_app',
      builder: (context, state) => const ResponsiveDownloadTheAppPage(),
    ),
    GoRoute(
      path: '/magazalarimiz',
      name: 'stores',
      builder: (context, state) => const ResponsiveLayoutStoresPage(),
    ),
    GoRoute(
      path: '/israfi-onleyelim',
      name: 'israf',
      builder: (context, state) => const ResponsiveLayoutIsrafPage(),
    ),
    GoRoute(
      path: '/iletisim',
      name: 'contact',
      builder: (context, state) => const ResponsiveContactPage(),
    ),
    GoRoute(
      path: '/yasal-bildirimler',
      name: 'legal_notices',
      builder: (context, state) => const ResponsiveLayoutLegalNotices(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '404',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sayfa Bulunamadı',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Ana Sayfaya Dön'),
          ),
        ],
      ),
    ),
  ),
);
