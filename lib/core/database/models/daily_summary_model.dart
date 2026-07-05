import 'package:isar/isar.dart';
import 'sleep_record_model.dart';
import 'water_entry_model.dart';

part 'daily_summary_model.g.dart';

@collection
class DailySummaryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  DateTime date = DateTime.now(); // Should be normalized to start of day
  
  int sleepMinutes = 0;
  int waterMl = 0;
  int remindersCompleted = 0;
  int alarmSuccess = 0;
  int overallScore = 0;

  final sleepRecords = IsarLinks<SleepRecordModel>();
  final waterEntries = IsarLinks<WaterEntryModel>();
}
