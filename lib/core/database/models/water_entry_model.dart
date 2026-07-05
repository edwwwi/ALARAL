import 'package:isar/isar.dart';

part 'water_entry_model.g.dart';

@collection
class WaterEntryModel {
  Id id = Isar.autoIncrement;

  int amountMl = 0;
  
  @Index()
  DateTime loggedAt = DateTime.now();
  
  String source = 'Manual'; // Manual, QuickAdd, SmartBottle
  String notes = '';
}
