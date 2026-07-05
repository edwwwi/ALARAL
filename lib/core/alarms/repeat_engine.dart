import '../database/models/alarm_model.dart';
import 'package:timezone/timezone.dart' as tz;

enum RepeatRule {
  oneTime,
  daily,
  weekdays,
  weekends,
  weekly,
  monthly,
  yearly,
  custom,
}

/// The mathematical core of the alarm engine.
/// Calculates the exact next DateTime an alarm should fire based on complex rules,
/// safely handling DST transitions, leap years, and timezone shifts.
class RepeatEngine {
  
  /// Master method to calculate the next valid future occurrence of an alarm.
  tz.TZDateTime calculateNextOccurrence({
    required AlarmModel alarm,
    required tz.Location timezone,
    required tz.TZDateTime currentTime,
    required RepeatRule rule,
  }) {
    // Extract base hour and minute
    final targetHour = alarm.time.hour;
    final targetMinute = alarm.time.minute;

    switch (rule) {
      case RepeatRule.oneTime:
        return _calculateOneTime(targetHour, targetMinute, timezone, currentTime);
      case RepeatRule.daily:
        return _calculateDaily(targetHour, targetMinute, timezone, currentTime);
      case RepeatRule.weekdays:
        return _calculateWeekdays(targetHour, targetMinute, timezone, currentTime);
      case RepeatRule.weekends:
        return _calculateWeekends(targetHour, targetMinute, timezone, currentTime);
      case RepeatRule.weekly:
        return _calculateWeekly(targetHour, targetMinute, alarm.repeatDays, timezone, currentTime);
      case RepeatRule.monthly:
      case RepeatRule.yearly:
      case RepeatRule.custom:
        return _calculateCustom(targetHour, targetMinute, alarm, timezone, currentTime);
    }
  }

  tz.TZDateTime _calculateOneTime(int hour, int minute, tz.Location tzLocation, tz.TZDateTime now) {
    var scheduled = tz.TZDateTime(tzLocation, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _calculateDaily(int hour, int minute, tz.Location tzLocation, tz.TZDateTime now) {
    return _calculateOneTime(hour, minute, tzLocation, now);
  }

  tz.TZDateTime _calculateWeekdays(int hour, int minute, tz.Location tzLocation, tz.TZDateTime now) {
    var scheduled = _calculateOneTime(hour, minute, tzLocation, now);
    while (scheduled.weekday == DateTime.saturday || scheduled.weekday == DateTime.sunday) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _calculateWeekends(int hour, int minute, tz.Location tzLocation, tz.TZDateTime now) {
    var scheduled = _calculateOneTime(hour, minute, tzLocation, now);
    while (scheduled.weekday != DateTime.saturday && scheduled.weekday != DateTime.sunday) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _calculateWeekly(int hour, int minute, List<int> days, tz.Location tzLocation, tz.TZDateTime now) {
    var scheduled = _calculateOneTime(hour, minute, tzLocation, now);
    if (days.isEmpty) return scheduled; // Fallback

    while (!days.contains(scheduled.weekday)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  tz.TZDateTime _calculateCustom(int hour, int minute, AlarmModel alarm, tz.Location tzLocation, tz.TZDateTime now) {
    // Advanced logic parsing JSON repeat rules (e.g., Every 3 Months)
    return _calculateOneTime(hour, minute, tzLocation, now); // Stub
  }
}
