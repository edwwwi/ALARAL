import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

enum MissionStatus { pending, active, completed }

class RingState {
  final bool isDismissed;
  final bool isSnoozed;
  final MissionStatus missionStatus;
  final String currentQuote;
  final String challengeType;

  RingState({
    required this.isDismissed,
    required this.isSnoozed,
    required this.missionStatus,
    required this.currentQuote,
    required this.challengeType,
  });

  RingState copyWith({
    bool? isDismissed,
    bool? isSnoozed,
    MissionStatus? missionStatus,
    String? currentQuote,
    String? challengeType,
  }) {
    return RingState(
      isDismissed: isDismissed ?? this.isDismissed,
      isSnoozed: isSnoozed ?? this.isSnoozed,
      missionStatus: missionStatus ?? this.missionStatus,
      currentQuote: currentQuote ?? this.currentQuote,
      challengeType: challengeType ?? this.challengeType,
    );
  }
}

class RingStateNotifier extends StateNotifier<RingState> {
  RingStateNotifier()
      : super(RingState(
          isDismissed: false,
          isSnoozed: false,
          missionStatus: MissionStatus.pending,
          currentQuote: _getRandomQuote(),
          challengeType: 'Math', // Mocking a math mission for preview
        ));

  static final List<String> _quotes = [
    'Good Morning ☀️',
    'Today is a fresh start.',
    'Stay consistent.',
    'Every morning counts.',
    'Let\'s make today productive.',
  ];

  static String _getRandomQuote() {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }

  void activateMission() {
    state = state.copyWith(missionStatus: MissionStatus.active);
  }

  void completeMission() {
    state = state.copyWith(missionStatus: MissionStatus.completed);
    dismissAlarm(); // Automatically dismiss when mission is done
  }

  void dismissAlarm() {
    state = state.copyWith(isDismissed: true);
  }

  void snoozeAlarm() {
    state = state.copyWith(isSnoozed: true);
  }
}

final ringStateProvider = StateNotifierProvider.autoDispose<RingStateNotifier, RingState>((ref) {
  return RingStateNotifier();
});
