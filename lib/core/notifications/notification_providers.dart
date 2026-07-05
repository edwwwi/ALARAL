import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';
import 'scheduler_service.dart';
import 'permission_service.dart';
import 'timezone_service.dart';

// --- Core Plugins ---
final flutterLocalNotificationsPluginProvider = Provider<FlutterLocalNotificationsPlugin>((ref) {
  return FlutterLocalNotificationsPlugin();
});

// --- Services Providers ---
final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});

final timezoneServiceProvider = Provider<TimezoneService>((ref) {
  final service = TimezoneService();
  // Ensure initializeTimeZones is called during app startup separately
  return service;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final plugin = ref.watch(flutterLocalNotificationsPluginProvider);
  return NotificationService(plugin);
});

final schedulerServiceProvider = Provider<SchedulerService>((ref) {
  final plugin = ref.watch(flutterLocalNotificationsPluginProvider);
  final tzService = ref.watch(timezoneServiceProvider);
  return SchedulerService(plugin, tzService);
});
