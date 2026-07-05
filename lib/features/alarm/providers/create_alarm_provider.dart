import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAlarmState {
  final int hour;
  final int minute;
  final bool isAm;
  final List<int> repeatDays;
  final String label;
  final String ringtone;
  final String vibration;
  final int snoozeDuration;
  final String challengeType;

  CreateAlarmState({
    required this.hour,
    required this.minute,
    required this.isAm,
    required this.repeatDays,
    required this.label,
    required this.ringtone,
    required this.vibration,
    required this.snoozeDuration,
    required this.challengeType,
  });

  CreateAlarmState copyWith({
    int? hour,
    int? minute,
    bool? isAm,
    List<int>? repeatDays,
    String? label,
    String? ringtone,
    String? vibration,
    int? snoozeDuration,
    String? challengeType,
  }) {
    return CreateAlarmState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      isAm: isAm ?? this.isAm,
      repeatDays: repeatDays ?? this.repeatDays,
      label: label ?? this.label,
      ringtone: ringtone ?? this.ringtone,
      vibration: vibration ?? this.vibration,
      snoozeDuration: snoozeDuration ?? this.snoozeDuration,
      challengeType: challengeType ?? this.challengeType,
    );
  }
}

class CreateAlarmNotifier extends StateNotifier<CreateAlarmState> {
  CreateAlarmNotifier()
      : super(CreateAlarmState(
          hour: 6,
          minute: 30,
          isAm: true,
          repeatDays: [1, 2, 3, 4, 5],
          label: '',
          ringtone: 'Gentle Sunrise',
          vibration: 'Normal',
          snoozeDuration: 10,
          challengeType: 'None',
        ));

  void updateTime(int hour, int minute, bool isAm) {
    state = state.copyWith(hour: hour, minute: minute, isAm: isAm);
  }

  void toggleRepeatDay(int day) {
    final days = List<int>.from(state.repeatDays);
    if (days.contains(day)) {
      days.remove(day);
    } else {
      days.add(day);
    }
    days.sort();
    state = state.copyWith(repeatDays: days);
  }

  void setRepeatPreset(String preset) {
    switch (preset) {
      case 'One Time':
        state = state.copyWith(repeatDays: []);
        break;
      case 'Daily':
        state = state.copyWith(repeatDays: [1, 2, 3, 4, 5, 6, 7]);
        break;
      case 'Weekdays':
        state = state.copyWith(repeatDays: [1, 2, 3, 4, 5]);
        break;
      case 'Weekends':
        state = state.copyWith(repeatDays: [6, 7]);
        break;
    }
  }

  void updateLabel(String label) {
    state = state.copyWith(label: label);
  }

  void updateSound(String sound) {
    state = state.copyWith(ringtone: sound);
  }

  void updateVibration(String pattern) {
    state = state.copyWith(vibration: pattern);
  }

  void updateSnooze(int duration) {
    state = state.copyWith(snoozeDuration: duration);
  }

  void updateMission(String mission) {
    state = state.copyWith(challengeType: mission);
  }
}

final createAlarmProvider =
    StateNotifierProvider.autoDispose<CreateAlarmNotifier, CreateAlarmState>((ref) {
  return CreateAlarmNotifier();
});
