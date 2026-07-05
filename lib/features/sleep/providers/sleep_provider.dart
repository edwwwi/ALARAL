import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/dependency_providers.dart';
import '../../../core/database/models/sleep_record_model.dart';

final sleepRecordsProvider = FutureProvider<List<SleepRecordModel>>((ref) async {
  final repo = await ref.watch(sleepRepositoryProvider.future);
  return await repo.getAllSleepRecords(); 
});

final addSleepSessionProvider = Provider((ref) => (SleepRecordModel record) async {
  final repo = await ref.read(sleepRepositoryProvider.future);
  await repo.createSleepRecord(record);
  ref.invalidate(sleepRecordsProvider);
});
