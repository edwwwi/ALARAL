import 'package:isar/isar.dart';

part 'user_settings_model.g.dart';

@collection
class UserSettingsModel {
  Id id = Isar.autoIncrement;

  String themeMode = 'Dark';
  String accentStyle = 'Minimal';
  String fontScale = 'Medium';
  bool reduceMotion = false;
  bool notificationsEnabled = true;
  
  int sleepGoalHours = 8;
  double dailyWaterGoal = 3.0; // In Liters
  
  // Stored as JSON string or separated fields
  String alarmDefaults = '{}';

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
