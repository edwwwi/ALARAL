import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../database_manager.dart';
import '../repositories/alarm_repository.dart';
import '../repositories/settings_repository.dart';
import '../repositories/water_repository.dart';
import '../services/alarm_service.dart';

// --- Database Instance Provider ---
final isarProvider = FutureProvider<Isar>((ref) async {
  return await DatabaseManager.getInstance();
});

// --- Repositories Providers ---
final alarmRepositoryProvider = FutureProvider<AlarmRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return AlarmRepository(isar);
});

final settingsRepositoryProvider = FutureProvider<SettingsRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return SettingsRepository(isar);
});

final waterRepositoryProvider = FutureProvider<WaterRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return WaterRepository(isar);
});

// --- Services Providers ---
final alarmServiceProvider = FutureProvider<AlarmService>((ref) async {
  final repo = await ref.watch(alarmRepositoryProvider.future);
  return AlarmService(repo);
});
