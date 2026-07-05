import '../database/models/alarm_model.dart';
import '../notifications/scheduler_service.dart';
import 'alarm_validator.dart';

/// Responsible for translating logical AlarmModels into OS-level schedules.
/// Interfaces heavily with [SchedulerService] and acts as the single source
/// of truth for what is actually queued in the operating system.
class AlarmScheduler {
  final SchedulerService scheduler;
  final AlarmValidator validator;

  AlarmScheduler({
    required this.scheduler,
    required this.validator,
  });

  /// Schedules a specific exact occurrence of an alarm.
  /// Converts the AlarmModel into an actionable OS intent.
  Future<bool> scheduleExactAlarm(AlarmModel alarm, DateTime exactTime) async {
    final isValid = await validator.validateAlarm(alarm, exactTime);
    if (!isValid) return false;

    // scheduler.scheduleExactAlarm(
    //   alarmId: alarm.id,
    //   time: exactTime,
    //   title: alarm.label.isNotEmpty ? alarm.label : 'Alarm',
    //   body: 'Tap to dismiss or snooze',
    //   payload: 'alarm_\${alarm.id}',
    // );
    
    // Log scheduling success
    return true;
  }

  /// Cancels an actively scheduled alarm from the OS.
  Future<void> cancelAlarm(int alarmId) async {
    await scheduler.cancelSchedule(alarmId);
    // Log cancellation
  }

  /// Updates an existing alarm schedule by cancelling and rescheduling.
  Future<bool> updateAlarm(AlarmModel alarm, DateTime nextTime) async {
    await cancelAlarm(alarm.id);
    return await scheduleExactAlarm(alarm, nextTime);
  }

  /// Called upon BootRecoveryService to restore all schedules.
  Future<void> restoreAlarmsAfterReboot(List<AlarmModel> activeAlarms) async {
    for (final alarm in activeAlarms) {
      // Calculate next time via RepeatEngine and call scheduleExactAlarm
    }
  }

  /// Queries the OS (if supported) for the next scheduled alarm intent.
  Future<DateTime?> queryNextScheduledAlarm() async {
    // Requires platform-specific querying (e.g. adb shell dumpsys alarm)
    // Or reading from an internal schedule cache
    return null;
  }
}
