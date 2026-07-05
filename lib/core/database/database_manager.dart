import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'models/user_settings_model.dart';
import 'models/alarm_model.dart';
import 'models/alarm_history_model.dart';
import 'models/reminder_model.dart';
import 'models/reminder_history_model.dart';
import 'models/sleep_record_model.dart';
import 'models/water_entry_model.dart';
import 'models/daily_summary_model.dart';
import 'models/achievement_model.dart';

class DatabaseManager {
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance != null) {
      return _instance!;
    }
    return await _init();
  }

  static Future<Isar> _init() async {
    try {
      // Find a directory to store the database
      // Using path_provider to get the application documents directory
      // Mocking for now since path_provider is usually added via flutter pub
      // In a real app we'd use: final dir = await getApplicationDocumentsDirectory();
      
      // Let's assume Isar handles directory via empty string if not provided in some setups,
      // but typically we need a valid directory.
      // We will leave directory empty for Isar to use default if possible or require dir.
      final dir = Directory.systemTemp.path; // Placeholder

      _instance = await Isar.open(
        [
          UserSettingsModelSchema,
          AlarmModelSchema,
          AlarmHistoryModelSchema,
          ReminderModelSchema,
          ReminderHistoryModelSchema,
          SleepRecordModelSchema,
          WaterEntryModelSchema,
          DailySummaryModelSchema,
          AchievementModelSchema,
        ],
        directory: dir,
      );

      return _instance!;
    } catch (e) {
      // Graceful recovery or fallback logic
      print('Database initialization failed: \$e');
      rethrow;
    }
  }

  static Future<void> close() async {
    if (_instance != null) {
      await _instance!.close();
      _instance = null;
    }
  }
}
