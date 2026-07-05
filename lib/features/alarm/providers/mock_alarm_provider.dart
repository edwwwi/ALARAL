import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/alarm.dart';

final activeFilterProvider = StateProvider<String>((ref) => 'All');

final mockAlarmProvider = StateNotifierProvider<MockAlarmNotifier, List<Alarm>>((ref) {
  return MockAlarmNotifier();
});

class MockAlarmNotifier extends StateNotifier<List<Alarm>> {
  MockAlarmNotifier() : super(_initialAlarms);

  static final List<Alarm> _initialAlarms = [
    Alarm()
      ..id = 1
      ..time = DateTime.now().copyWith(hour: 6, minute: 30)
      ..repeatDays = [1, 2, 3, 4, 5] // Mon-Fri
      ..label = 'Gym'
      ..isActive = true,
    Alarm()
      ..id = 2
      ..time = DateTime.now().copyWith(hour: 8, minute: 00)
      ..repeatDays = [6] // Sat
      ..label = 'Weekend Sleep In'
      ..isActive = false,
    Alarm()
      ..id = 3
      ..time = DateTime.now().copyWith(hour: 7, minute: 15)
      ..repeatDays = [7] // Sun
      ..label = 'Sunday Run'
      ..isActive = true,
  ];

  void toggleAlarm(int id) {
    state = state.map((alarm) {
      if (alarm.id == id) {
        final newAlarm = Alarm()
          ..id = alarm.id
          ..time = alarm.time
          ..repeatDays = alarm.repeatDays
          ..label = alarm.label
          ..isActive = !alarm.isActive
          ..isSnoozed = alarm.isSnoozed
          ..challengeType = alarm.challengeType
          ..ringtone = alarm.ringtone
          ..vibration = alarm.vibration;
        return newAlarm;
      }
      return alarm;
    }).toList();
  }

  void deleteAlarm(int id) {
    state = state.where((alarm) => alarm.id != id).toList();
  }

  void duplicateAlarm(int id) {
    final alarmToDuplicate = state.firstWhere((alarm) => alarm.id == id);
    final newAlarm = Alarm()
      ..id = DateTime.now().millisecondsSinceEpoch // mock ID
      ..time = alarmToDuplicate.time
      ..repeatDays = alarmToDuplicate.repeatDays
      ..label = '${alarmToDuplicate.label} (Copy)'
      ..isActive = alarmToDuplicate.isActive
      ..isSnoozed = alarmToDuplicate.isSnoozed
      ..challengeType = alarmToDuplicate.challengeType
      ..ringtone = alarmToDuplicate.ringtone
      ..vibration = alarmToDuplicate.vibration;
    
    state = [...state, newAlarm];
  }
}

// Provider to get the next active alarm
final nextActiveAlarmProvider = Provider<Alarm?>((ref) {
  final alarms = ref.watch(mockAlarmProvider);
  final activeAlarms = alarms.where((a) => a.isActive).toList();
  if (activeAlarms.isEmpty) return null;
  
  // Sort by time (for mock purposes, just returning the first one or sorting purely by time of day)
  activeAlarms.sort((a, b) {
    final timeA = a.time.hour * 60 + a.time.minute;
    final timeB = b.time.hour * 60 + b.time.minute;
    return timeA.compareTo(timeB);
  });
  
  return activeAlarms.first;
});
