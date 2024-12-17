import 'package:flutter/material.dart';

class TabletLayoutHomePageView extends StatelessWidget {
  const TabletLayoutHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabiki Tablet'),
      ),
      body: const Center(
        child: Text('Tablet Layout'),
      ),
    );
  }
} 