import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

/// Service responsible for handling all Timezone calculations to ensure
/// alarms trigger correctly across DST changes and travel.
class TimezoneService {
  
  /// Initializes the timezone database and sets the local location.
  /// Must be called during app startup.
  Future<void> initializeTimeZones() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  /// Gets the current timezone-aware local time.
  tz.TZDateTime getLocalTime() {
    return tz.TZDateTime.now(tz.local);
  }

  /// Converts a standard Dart DateTime to a TZDateTime.
  tz.TZDateTime convertToTZDateTime(DateTime dateTime) {
    return tz.TZDateTime.from(dateTime, tz.local);
  }

  /// Calculates the next occurrence of a time (e.g., 07:00 AM) based on repeat days.
  /// Handles crossing midnight, DST transitions, and specific days of the week.
  tz.TZDateTime calculateNextOccurrence({
    required int hour,
    required int minute,
    required List<int> repeatDays, // 1 = Mon, 7 = Sun
  }) {
    final now = getLocalTime();
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (repeatDays.isEmpty) {
      // One-time alarm
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }
      return scheduledDate;
    }

    // Handle repeating days
    while (!repeatDays.contains(scheduledDate.weekday) || scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }
}
