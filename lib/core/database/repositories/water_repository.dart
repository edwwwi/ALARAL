import 'package:isar/isar.dart';
import '../models/water_entry_model.dart';

class WaterRepository {
  final Isar isar;

  WaterRepository(this.isar);

  Future<int> addWaterEntry(WaterEntryModel entry) async {
    return await isar.writeTxn(() async {
      return await isar.waterEntryModels.put(entry);
    });
  }

  Future<List<WaterEntryModel>> getWaterEntriesForDay(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    
    return await isar.waterEntryModels.where()
      .loggedAtBetween(startOfDay, endOfDay)
      .findAll();
  }
  
  Future<bool> deleteWaterEntry(int id) async {
    return await isar.writeTxn(() async {
      return await isar.waterEntryModels.delete(id);
    });
  }
}
