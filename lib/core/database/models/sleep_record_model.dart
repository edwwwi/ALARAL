import 'package:isar/isar.dart';

part 'sleep_record_model.g.dart';

@collection
class SleepRecordModel {
  Id id = Isar.autoIncrement;

  @Index()
  DateTime bedTime = DateTime.now();
  
  DateTime wakeTime = DateTime.now();
  
  int durationMinutes = 0;
  int sleepScore = 0;
  int sleepDebt = 0; // minutes
  
  String method = 'Estimated'; // Estimated, Manual, Device
  String quality = 'Good';

  @Index()
  DateTime createdAt = DateTime.now();
}
