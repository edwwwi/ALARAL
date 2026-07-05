import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Manages the creation of highly customized notifications (Silent, Persistent, Actionable)
/// specifically tailored for reminders, separating them from critical alarms.
class NotificationManager {
  final FlutterLocalNotificationsPlugin plugin;

  NotificationManager(this.plugin);

  /// Displays a notification with interactive buttons (Complete, Snooze)
  Future<void> showActionableNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required String channelId,
  }) async {
    /*
    final androidDetails = AndroidNotificationDetails(
      channelId,
      'Actionable Reminders',
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('mark_complete', 'Mark Complete', showsUserInterface: false),
        AndroidNotificationAction('snooze_15', 'Snooze 15m', showsUserInterface: false),
      ],
    );
    */
  }

  /// Displays an ongoing/persistent notification (e.g. Daily Water Progress)
  Future<void> updatePersistentNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required String channelId,
  }) async {
    /*
    final androidDetails = AndroidNotificationDetails(
      channelId,
      'Persistent',
      ongoing: true,
      autoCancel: false,
    );
    */
  }
}
