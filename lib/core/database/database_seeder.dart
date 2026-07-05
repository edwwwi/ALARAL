import 'package:isar/isar.dart';
import 'models/alarm_model.dart';
import 'models/water_entry_model.dart';
import 'models/daily_summary_model.dart';

class DatabaseSeeder {
  static Future<void> seed(Isar isar) async {
    // Check if database is already populated
    if (await isar.alarmModels.count() > 0) return;

    await isar.writeTxn(() async {
      // Seed Dummy Alarms
      final alarm1 = AlarmModel()
        ..time = DateTime.now().add(const Duration(hours: 8))
        ..label = 'Morning Routine'
        ..enabled = true
        ..repeatDays = [1, 2, 3, 4, 5]
        ..sound = 'default_alarm'
        ..vibration = true;

      final alarm2 = AlarmModel()
        ..time = DateTime.now().add(const Duration(hours: 12))
        ..label = 'Workout'
        ..enabled = false
        ..repeatDays = []
        ..sound = 'default_alarm'
        ..vibration = true;

      await isar.alarmModels.putAll([alarm1, alarm2]);

      // Seed Dummy Water Log
      final water = WaterEntryModel()
        ..amountMl = 1200
        ..loggedAt = DateTime.now().subtract(const Duration(hours: 4))
        ..source = 'Manual';

      await isar.waterEntryModels.put(water);
      
      // Seed Daily Summary for the Dashboard
      final summary = DailySummaryModel()
        ..date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
        ..waterMl = 1200
        ..sleepMinutes = 440
        ..remindersCompleted = 3
        ..alarmSuccess = 2
        ..overallScore = 85;
        
      await isar.dailySummaryModels.put(summary);
    });
  }
}
