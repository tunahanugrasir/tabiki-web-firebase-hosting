import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabiki_web/presentation/pages/home/responsive_home_page.dart';
import 'core/providers/responsive_layout_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ResponsiveLayoutProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tabiki',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ResponsiveHomePage(),
    );
  }
}
