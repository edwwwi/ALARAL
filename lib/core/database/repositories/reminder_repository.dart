import 'package:isar/isar.dart';
import '../models/reminder_model.dart';
import '../models/reminder_history_model.dart';

class ReminderRepository {
  final Isar isar;

  ReminderRepository(this.isar);

  Future<int> createReminder(ReminderModel reminder) async {
    return await isar.writeTxn(() async {
      return await isar.reminderModels.put(reminder);
    });
  }

  Future<ReminderModel?> getReminder(int id) async {
    return await isar.reminderModels.get(id);
  }

  Future<List<ReminderModel>> getAllReminders() async {
    return await isar.reminderModels.where().findAll();
  }
  
  Future<List<ReminderModel>> getActiveReminders() async {
    return await isar.reminderModels.filter().isArchivedEqualTo(false).findAll();
  }

  Future<int> updateReminder(ReminderModel reminder) async {
    return await isar.writeTxn(() async {
      reminder.updatedAt = DateTime.now();
      return await isar.reminderModels.put(reminder);
    });
  }

  Future<bool> deleteReminder(int id) async {
    return await isar.writeTxn(() async {
      return await isar.reminderModels.delete(id);
    });
  }
  
  Future<void> addHistory(int reminderId, ReminderHistoryModel history) async {
    await isar.writeTxn(() async {
      final reminder = await isar.reminderModels.get(reminderId);
      if (reminder != null) {
        history.reminder.value = reminder;
        await isar.reminderHistoryModels.put(history);
        await history.reminder.save();
      }
    });
  }
}
