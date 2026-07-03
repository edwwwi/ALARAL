import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/notifications/local_notifications.dart';
import 'data/local_db.dart';
import 'features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Local Database (Isar)
  await LocalDb.initialize();
  
  // Initialize Local Notifications
  await LocalNotifications.initialize();

  runApp(
    const ProviderScope(
      child: AlaralApp(),
    ),
  );
}

class AlaralApp extends StatelessWidget {
  const AlaralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alaral',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}


