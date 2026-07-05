import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'timezone_service.dart';

/// Service responsible for executing exact and inexact time-based scheduling.
///
/// Integrates closely with [FlutterLocalNotificationsPlugin.zonedSchedule].
class SchedulerService {
  final FlutterLocalNotificationsPlugin plugin;
  final TimezoneService tzService;

  SchedulerService(this.plugin, this.tzService);

  /// Schedules an exact alarm.
  /// Requires SCHEDULE_EXACT_ALARM permission on Android 12+.
  Future<void> scheduleExactAlarm({
    required int alarmId,
    required DateTime time,
    required String title,
    required String body,
    required String payload,
  }) async {
    // 1. Convert DateTime to TZDateTime using tzService
    // 2. Call plugin.zonedSchedule with androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle
    // 3. Configure fullScreenIntent if it's an alarm
  }

  /// Schedules a standard reminder.
  Future<void> scheduleReminder({
    required int reminderId,
    required DateTime time,
    required String title,
    required String body,
    required String payload,
  }) async {
    // 1. Convert DateTime
    // 2. Schedule with standard allowWhileIdle
  }

  /// Reschedules a repeating alarm for its next occurrence.
  Future<void> rescheduleRepeating({
    required int alarmId,
    required List<int> repeatDays,
    required String timeString, // e.g. "07:00"
    // Other payload data
  }) async {
    // 1. Calculate next valid date using TimezoneService based on repeatDays
    // 2. Call scheduleExactAlarm
  }

  /// Cancels a scheduled event.
  Future<void> cancelSchedule(int id) async {
    await plugin.cancel(id, tag: null);
  }

  /// Cancels all scheduled events.
  Future<void> cancelAll() async {
    await plugin.cancelAll();
  }
}
