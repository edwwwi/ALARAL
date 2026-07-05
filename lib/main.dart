import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/notifications/local_notifications.dart';
import 'core/database/database_manager.dart';
import 'core/database/database_seeder.dart';
import 'features/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Local Database (Isar) using the new architecture
  final isar = await DatabaseManager.getInstance();
  
  // Seed database with mock data on first run
  await DatabaseSeeder.seed(isar);
  
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
      home: const MainScreen(),
    );
  }
}


