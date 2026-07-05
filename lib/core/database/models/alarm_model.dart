import 'package:isar/isar.dart';
import 'alarm_history_model.dart';

part 'alarm_model.g.dart';

@collection
class AlarmModel {
  Id id = Isar.autoIncrement;

  @Index()
  DateTime time = DateTime.now();
  
  String label = '';
  
  @Index()
  bool enabled = true;
  
  List<int> repeatDays = [];
  
  String sound = 'Default';
  double volume = 0.8;
  bool gradualVolume = true;
  bool vibration = true;
  String missionType = 'None';
  
  bool snoozeEnabled = true;
  int snoozeDuration = 10; // minutes

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Backlink(to: 'alarm')
  final history = IsarLinks<AlarmHistoryModel>();
}
