import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/models/alarm_model.dart';
import '../../../core/providers/dependency_providers.dart';

class AlarmNotifier extends AsyncNotifier<List<AlarmModel>> {
  @override
  FutureOr<List<AlarmModel>> build() async {
    return _fetchAlarms();
  }

  Future<List<AlarmModel>> _fetchAlarms() async {
    final repo = await ref.read(alarmRepositoryProvider.future);
    return await repo.getAllAlarms();
  }

  Future<void> toggleAlarm(AlarmModel alarm, bool isEnabled) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = await ref.read(alarmServiceProvider.future);
      await service.toggleAlarm(alarm, isEnabled);
      return _fetchAlarms();
    });
  }

  Future<void> deleteAlarm(int id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = await ref.read(alarmRepositoryProvider.future);
      await repo.deleteAlarm(id);
      return _fetchAlarms();
    });
  }

  Future<void> addAlarm(AlarmModel alarm) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final service = await ref.read(alarmServiceProvider.future);
      await service.createAndScheduleAlarm(alarm);
      return _fetchAlarms();
    });
  }
}

final alarmNotifierProvider = AsyncNotifierProvider<AlarmNotifier, List<AlarmModel>>(() {
  return AlarmNotifier();
});

// Derived Provider to avoid full list rebuilds when just needing the next active one
final nextActiveAlarmProvider = Provider<AsyncValue<AlarmModel?>>((ref) {
  final alarmsState = ref.watch(alarmNotifierProvider);
  
  return alarmsState.whenData((alarms) {
    final activeAlarms = alarms.where((a) => a.enabled).toList();
    if (activeAlarms.isEmpty) return null;
    
    activeAlarms.sort((a, b) => a.time.compareTo(b.time));
    return activeAlarms.first;
  });
});
