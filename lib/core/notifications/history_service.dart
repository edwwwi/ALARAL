import '../database/database_manager.dart';
import '../database/models/alarm_history_model.dart';
import '../database/models/reminder_history_model.dart';
import 'package:isar/isar.dart';

/// Centralized service for logging all notification and user interaction events.
class HistoryService {
  final Isar isar;

  HistoryService(this.isar);

  Future<void> logAlarmEvent(int alarmId, String eventType, {String notes = ''}) async {
    // 1. Fetch AlarmModel
    // 2. Create AlarmHistoryModel
    // 3. Save to Isar
  }

  Future<void> logReminderEvent(int reminderId, String status, {int delayMinutes = 0}) async {
    // 1. Fetch ReminderModel
    // 2. Create ReminderHistoryModel
    // 3. Save to Isar
  }
}
