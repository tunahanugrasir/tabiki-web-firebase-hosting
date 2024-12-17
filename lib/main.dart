import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabiki_web/presentation/pages/home/responsive_home_page.dart';
import 'package:tabiki_web/core/providers/responsive_layout_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDGj0t1XENKZuAN_0xHtxXuPTxUL5afdC8",
      authDomain: "tabiki-web.firebaseapp.com",
      projectId: "tabiki-web",
      storageBucket: "tabiki-web.firebasestorage.app",
      messagingSenderId: "639584241599",
      appId: "1:639584241599:web:04c12aa709e8b19680c30a",
      measurementId: "G-V31SBQZTP5"
    ),
  );
  
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
