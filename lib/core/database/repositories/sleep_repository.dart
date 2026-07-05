import 'package:isar/isar.dart';
import '../models/sleep_record_model.dart';

class SleepRepository {
  final Isar isar;

  SleepRepository(this.isar);

  Future<int> createSleepRecord(SleepRecordModel record) async {
    return await isar.writeTxn(() async {
      return await isar.sleepRecordModels.put(record);
    });
  }

  Future<List<SleepRecordModel>> getAllSleepRecords() async {
    return await isar.sleepRecordModels.where().sortByBedTimeDesc().findAll();
  }

  Future<List<SleepRecordModel>> getSleepRecordsInDateRange(DateTime start, DateTime end) async {
    return await isar.sleepRecordModels.where()
      .bedTimeBetween(start, end)
      .findAll();
  }
}
