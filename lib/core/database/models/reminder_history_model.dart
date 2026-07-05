import 'package:isar/isar.dart';
import 'reminder_model.dart';

part 'reminder_history_model.g.dart';

@collection
class ReminderHistoryModel {
  Id id = Isar.autoIncrement;

  final reminder = IsarLink<ReminderModel>();

  @Index()
  DateTime completedAt = DateTime.now();
  
  String status = 'Completed'; // Completed, Missed, Skipped
  int delayMinutes = 0;
  String notes = '';
}
