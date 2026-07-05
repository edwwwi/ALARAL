import '../repositories/alarm_repository.dart';
import '../models/alarm_model.dart';
import '../models/alarm_history_model.dart';

/// Business logic service for Alarm management.
/// Integrates with SchedulerService (injected at the provider level or directly)
/// to ensure DB state matches scheduled notifications.
class AlarmService {
  final AlarmRepository repository;
  // final SchedulerService scheduler; // To be injected

  AlarmService(this.repository);

  /// Creates a new alarm, saves to DB, and schedules it.
  Future<void> createAndScheduleAlarm(AlarmModel alarm) async {
    // 1. Save to DB
    final id = await repository.createAlarm(alarm);
    alarm.id = id;
    
    // 2. Call scheduler.scheduleExactAlarm(...)
  }

  /// Toggles an alarm on/off.
  Future<void> toggleAlarm(AlarmModel alarm, bool isEnabled) async {
    alarm.enabled = isEnabled;
    await repository.updateAlarm(alarm);
    
    if (isEnabled) {
      // scheduler.rescheduleRepeating(...)
    } else {
      // scheduler.cancelSchedule(alarm.id)
    }
  }

  /// Handles a user dismissing an actively ringing alarm.
  Future<void> dismissAlarm(AlarmModel alarm, String dismissType) async {
    final history = AlarmHistoryModel()
      ..scheduledTime = alarm.time
      ..actualDismissTime = DateTime.now()
      ..dismissType = dismissType;
      
    await repository.addHistory(alarm.id, history);
    
    // If one-time, disable it. If repeating, calculate next occurrence and reschedule.
    if (alarm.repeatDays.isEmpty) {
      await toggleAlarm(alarm, false);
    } else {
      // scheduler.rescheduleRepeating(...)
    }
  }

  /// Handles user snoozing an actively ringing alarm.
  Future<void> snoozeAlarm(AlarmModel alarm) async {
    // 1. Calculate snooze time (now + alarm.snoozeDuration)
    // 2. scheduler.scheduleExactAlarm(..., time: snoozeTime)
    // 3. Increment snoozeCount in active history log
  }

  /// Called when an alarm rings but the user never interacts with it.
  Future<void> handleMissedAlarm(int alarmId) async {
    final alarm = await repository.getAlarm(alarmId);
    if (alarm != null) {
      final history = AlarmHistoryModel()
        ..scheduledTime = alarm.time
        ..dismissType = 'Missed';
      
      await repository.addHistory(alarmId, history);
      
      // show missed notification via NotificationService
      // reschedule if repeating
    }
  }
}
