import '../database/models/reminder_model.dart';
import '../notifications/scheduler_service.dart';

/// Responsible for translating logical ReminderModels into OS-level schedules.
/// Handles complex recurring math specific to reminders.
class ReminderScheduler {
  final SchedulerService scheduler;

  ReminderScheduler({required this.scheduler});

  /// Schedules a specific exact occurrence of a reminder.
  Future<bool> scheduleReminder(ReminderModel reminder, DateTime exactTime) async {
    // 1. Verify if it's not archived
    if (reminder.isArchived) return false;

    // 2. Map ReminderModel to notification payload
    // final payload = 'reminder_\${reminder.id}';

    // 3. scheduler.scheduleReminder(...)
    return true;
  }

  /// Cancels an actively scheduled reminder from the OS.
  Future<void> cancelReminder(int reminderId) async {
    await scheduler.cancelSchedule(reminderId); // assuming same ID space or prefixed
  }

  /// Specialized scheduling for Water Reminders (e.g. interval-based)
  Future<void> scheduleSmartWaterReminder(DateTime nextTime) async {
    // Schedule a silent/default notification based on user water settings
  }

  /// Specialized scheduling for Sleep Reminders
  Future<void> scheduleSmartSleepReminder(DateTime nextTime) async {
    // Schedule a gentle notification reminding to sleep
  }
}
