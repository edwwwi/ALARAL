import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/alarm.dart';
import 'models/sleep_session.dart';
import 'models/reminder.dart';
import 'models/water_log.dart';

class LocalDb {
  static late Isar _isar;
  
  static Isar get instance => _isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        AlarmSchema,
        SleepSessionSchema,
        ReminderSchema,
        WaterLogSchema,
      ],
      directory: dir.path,
    );
  }
}
