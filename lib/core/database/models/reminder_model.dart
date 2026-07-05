import 'package:isar/isar.dart';
import 'reminder_history_model.dart';

part 'reminder_model.g.dart';

@collection
class ReminderModel {
  Id id = Isar.autoIncrement;

  String title = '';
  String emoji = '📌';
  String category = 'Personal';
  
  @Index()
  DateTime date = DateTime.now();
  String time = '';
  
  String repeatRule = 'One Time';
  String notificationType = 'Notification';
  String priority = 'Medium';
  String notes = '';
  
  bool isArchived = false;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  @Backlink(to: 'reminder')
  final history = IsarLinks<ReminderHistoryModel>();
}
