import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/dependency_providers.dart';
import '../../../core/database/models/daily_summary_model.dart';
import 'package:isar/isar.dart';

final dailySummaryProvider = FutureProvider<DailySummaryModel?>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  
  // Get today's summary
  final today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  return await isar.dailySummaryModels.where().dateEqualTo(today).findFirst();
});
