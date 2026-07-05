import '../database/models/reminder_model.dart';
import '../database/repositories/water_repository.dart';
import '../database/repositories/sleep_repository.dart';

/// Contains the business logic for resolving "Smart" constraints before
/// a reminder is allowed to trigger and alert the user.
class ReminderEngine {
  final WaterRepository waterRepo;
  final SleepRepository sleepRepo;

  ReminderEngine({
    required this.waterRepo,
    required this.sleepRepo,
  });

  /// Processes the trigger event of a reminder. 
  /// Usually called via a background isolate callback from flutter_local_notifications.
  Future<bool> processReminderTrigger(int reminderId, String reminderType) async {
    if (reminderType == 'Water') {
      return await _shouldTriggerWaterReminder();
    }
    if (reminderType == 'Sleep') {
      return await _shouldTriggerSleepReminder();
    }
    return true; // Normal reminders always trigger
  }

  Future<bool> _shouldTriggerWaterReminder() async {
    // final todayEntries = await waterRepo.getWaterEntriesForDay(DateTime.now());
    // final total = todayEntries.fold(0, (sum, entry) => sum + entry.amountMl);
    // if (total >= userGoal) return false; // Suppress notification
    return true;
  }

  Future<bool> _shouldTriggerSleepReminder() async {
    // If sleep has already been logged manually or via device today, suppress
    return true;
  }

  /// Logic to snooze a reminder.
  Future<void> snoozeReminder(ReminderModel reminder, int minutes) async {
    // 1. Calculate new time (now + minutes)
    // 2. Call ReminderScheduler to schedule temp notification
    // 3. Update ReminderHistoryService
  }

  /// Marks a reminder as complete and calculates next repeat if applicable.
  Future<void> markCompleted(ReminderModel reminder) async {
    // 1. Update history
    // 2. If repeating, calculate next date and call ReminderScheduler
  }

  /// Skips the current occurrence and moves to the next.
  Future<void> skipToday(ReminderModel reminder) async {
    // 1. Update history as skipped
    // 2. Schedule next
  }
}
