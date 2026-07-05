import 'package:isar/isar.dart';
import '../models/alarm_model.dart';
import '../models/alarm_history_model.dart';

class AlarmRepository {
  final Isar isar;

  AlarmRepository(this.isar);

  Future<int> createAlarm(AlarmModel alarm) async {
    return await isar.writeTxn(() async {
      return await isar.alarmModels.put(alarm);
    });
  }

  Future<AlarmModel?> getAlarm(int id) async {
    return await isar.alarmModels.get(id);
  }

  Future<List<AlarmModel>> getAllAlarms() async {
    return await isar.alarmModels.where().findAll();
  }

  Future<List<AlarmModel>> getEnabledAlarms() async {
    return await isar.alarmModels.where().enabledEqualTo(true).findAll();
  }

  Future<int> updateAlarm(AlarmModel alarm) async {
    return await isar.writeTxn(() async {
      return await isar.alarmModels.put(alarm);
    });
  }

  Future<bool> deleteAlarm(int id) async {
    return await isar.writeTxn(() async {
      return await isar.alarmModels.delete(id);
    });
  }
  
  Future<void> addHistory(int alarmId, AlarmHistoryModel history) async {
    await isar.writeTxn(() async {
      final alarm = await isar.alarmModels.get(alarmId);
      if (alarm != null) {
        history.alarm.value = alarm;
        await isar.alarmHistoryModels.put(history);
        await history.alarm.save();
      }
    });
  }
}
