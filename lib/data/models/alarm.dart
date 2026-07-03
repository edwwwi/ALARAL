import 'package:isar/isar.dart';

part 'alarm.g.dart';

@collection
class Alarm {
  Id id = Isar.autoIncrement;

  late DateTime time;
  
  late List<int> repeatDays; // 1 = Monday, 7 = Sunday
  
  String label = '';
  
  bool isActive = true;
  
  bool isSnoozed = false;
  
  String challengeType = 'None'; // None, Math, QR, Shake, Walk
  
  String ringtone = 'Default';
  
  bool vibration = true;
}
