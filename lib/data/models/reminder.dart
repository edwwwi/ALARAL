import 'package:isar/isar.dart';

part 'reminder.g.dart';

@collection
class Reminder {
  Id id = Isar.autoIncrement;

  late String title;
  
  late String emoji; // e.g., 🎂, 💼, 💧

  late DateTime date;

  String type = 'One-time'; // One-time, Daily, Weekly, Monthly, Yearly

  bool isCompleted = false;

  bool hasNotification = true;
  
  String notificationType = 'Silent'; // Silent, Alarm, Persistent
}
