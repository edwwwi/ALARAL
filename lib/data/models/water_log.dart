import 'package:isar/isar.dart';

part 'water_log.g.dart';

@collection
class WaterLog {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  int totalIntakeMl = 0;

  int goalMl = 2000;
  
  List<int> logEntries = []; // Each entry is the amount in ml
}
