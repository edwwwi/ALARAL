import 'package:isar/isar.dart';

part 'achievement_model.g.dart';

@collection
class AchievementModel {
  Id id = Isar.autoIncrement;

  String title = '';
  String description = '';
  String type = 'General'; // Sleep, Water, Alarm, Reminder
  double progress = 0.0; // 0.0 to 1.0
  
  bool completed = false;
  DateTime? completedAt;
}
