import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/dependency_providers.dart';
import '../../../core/database/models/water_entry_model.dart';

final waterLogsProvider = FutureProvider<List<WaterEntryModel>>((ref) async {
  final repo = await ref.watch(waterRepositoryProvider.future);
  final today = DateTime.now();
  return await repo.getWaterEntriesForDay(DateTime(today.year, today.month, today.day));
});

final addWaterProvider = Provider((ref) => (int amount) async {
  final repo = await ref.read(waterRepositoryProvider.future);
  final entry = WaterEntryModel()
    ..amountMl = amount
    ..loggedAt = DateTime.now()
    ..source = 'Manual';
  await repo.addWaterEntry(entry);
  ref.invalidate(waterLogsProvider);
});
