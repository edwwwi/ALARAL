import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../database/database_manager.dart';
import '../database/repositories/alarm_repository.dart';
import '../database/repositories/reminder_repository.dart';
import '../database/repositories/sleep_repository.dart';
import '../database/repositories/water_repository.dart';
import '../database/repositories/settings_repository.dart';

import '../database/services/alarm_service.dart';

// --- Database Instance ---
final isarProvider = FutureProvider<Isar>((ref) async {
  return await DatabaseManager.getInstance();
});

// --- Repositories ---
final alarmRepositoryProvider = FutureProvider<AlarmRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return AlarmRepository(isar);
});

final reminderRepositoryProvider = FutureProvider<ReminderRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return ReminderRepository(isar);
});

final sleepRepositoryProvider = FutureProvider<SleepRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return SleepRepository(isar);
});

final waterRepositoryProvider = FutureProvider<WaterRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return WaterRepository(isar);
});

final settingsRepositoryProvider = FutureProvider<SettingsRepository>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  return SettingsRepository(isar);
});

// --- Services ---
final alarmServiceProvider = FutureProvider<AlarmService>((ref) async {
  final repo = await ref.watch(alarmRepositoryProvider.future);
  return AlarmService(repo);
});
