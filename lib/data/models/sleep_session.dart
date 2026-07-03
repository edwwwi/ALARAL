import 'package:isar/isar.dart';

part 'sleep_session.g.dart';

@collection
class SleepSession {
  Id id = Isar.autoIncrement;

  late DateTime startTime;
  
  late DateTime endTime;
  
  int get durationMinutes => endTime.difference(startTime).inMinutes;

  int sleepScore = 0; // 0 to 100

  String notes = '';
}
