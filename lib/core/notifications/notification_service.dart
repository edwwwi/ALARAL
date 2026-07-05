import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Service responsible for managing AndroidNotificationChannels, checking permissions,
/// and showing immediate (foreground/background) notifications.
///
/// NOTE: Time-based scheduling is delegated to [SchedulerService].
class NotificationService {
  final FlutterLocalNotificationsPlugin plugin;

  NotificationService(this.plugin);

  /// Initializes plugin and creates all necessary channels.
  Future<void> initialize() async {
    // 1. Configure initialization settings (Android/iOS)
    // 2. Call plugin.initialize(...)
    // 3. Create Channels
    await _createChannels();
  }

  Future<void> _createChannels() async {
    // Alarm Channel - MAX Importance, Full Screen Intent, Sound, Vibration
    const alarmChannel = AndroidNotificationChannel(
      'alaral_alarm_channel',
      'Alarms',
      description: 'Critical alarms that wake you up.',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      // sound: RawResourceAndroidNotificationSound('alarm_sound'),
    );

    // Reminder Channel - HIGH Importance
    const reminderChannel = AndroidNotificationChannel(
      'alaral_reminder_channel',
      'Reminders',
      description: 'Important tasks and reminders.',
      importance: Importance.high,
      playSound: true,
    );

    // Water & Sleep Channel - DEFAULT Importance
    const healthChannel = AndroidNotificationChannel(
      'alaral_health_channel',
      'Health & Wellness',
      description: 'Water and sleep tracking notifications.',
      importance: Importance.defaultImportance,
      playSound: false, // Maybe silent depending on settings
    );

    // Insights & Achievements - LOW Importance (Silent)
    const silentChannel = AndroidNotificationChannel(
      'alaral_silent_channel',
      'Insights & Achievements',
      description: 'Silent updates about your progress.',
      importance: Importance.low,
      playSound: false,
      enableVibration: false,
    );

    final androidImplementation =
        plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      await androidImplementation.createNotificationChannel(alarmChannel);
      await androidImplementation.createNotificationChannel(reminderChannel);
      await androidImplementation.createNotificationChannel(healthChannel);
      await androidImplementation.createNotificationChannel(silentChannel);
    }
  }

  /// Displays an immediate notification.
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required String channelId,
  }) async {
    // Implementation to show notification
  }

  /// Displays a full-screen alarm notification.
  Future<void> showFullScreenAlarm({
    required int alarmId,
    required String title,
    required String payload,
  }) async {
    // Configure fullScreenIntent: true on AndroidNotificationDetails
  }

  /// Cancels a specific notification by ID.
  Future<void> cancelNotification(int id) async {
    await plugin.cancel(id, tag: null);
  }

  /// Cancels all active notifications.
  Future<void> cancelAll() async {
    await plugin.cancelAll();
  }
}
