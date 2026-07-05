import 'package:isar/isar.dart';
import 'alarm_model.dart';

part 'alarm_history_model.g.dart';

@collection
class AlarmHistoryModel {
  Id id = Isar.autoIncrement;

  final alarm = IsarLink<AlarmModel>();

  @Index()
  DateTime scheduledTime = DateTime.now();
  
  DateTime? actualDismissTime;
  
  String dismissType = 'Normal'; // Mission, Snooze, Normal, Missed
  int snoozeCount = 0;
  String notes = '';

  @Index()
  DateTime createdAt = DateTime.now();
}
