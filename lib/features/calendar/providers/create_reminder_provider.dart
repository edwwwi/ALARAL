import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateReminderState {
  final String emoji;
  final String title;
  final String category;
  final String dateStr;
  final bool timeRequired;
  final String timeStr;
  final String repeat;
  final String notificationType;

  CreateReminderState({
    required this.emoji,
    required this.title,
    required this.category,
    required this.dateStr,
    required this.timeRequired,
    required this.timeStr,
    required this.repeat,
    required this.notificationType,
  });

  CreateReminderState copyWith({
    String? emoji,
    String? title,
    String? category,
    String? dateStr,
    bool? timeRequired,
    String? timeStr,
    String? repeat,
    String? notificationType,
  }) {
    return CreateReminderState(
      emoji: emoji ?? this.emoji,
      title: title ?? this.title,
      category: category ?? this.category,
      dateStr: dateStr ?? this.dateStr,
      timeRequired: timeRequired ?? this.timeRequired,
      timeStr: timeStr ?? this.timeStr,
      repeat: repeat ?? this.repeat,
      notificationType: notificationType ?? this.notificationType,
    );
  }
}

class CreateReminderNotifier extends StateNotifier<CreateReminderState> {
  CreateReminderNotifier()
      : super(CreateReminderState(
          emoji: '📌',
          title: '',
          category: 'Personal',
          dateStr: 'Today',
          timeRequired: false,
          timeStr: 'All Day',
          repeat: 'One Time',
          notificationType: 'Alarm Notification',
        ));

  void updateEmoji(String emoji) => state = state.copyWith(emoji: emoji);
  void updateTitle(String title) => state = state.copyWith(title: title);
  void updateCategory(String category) => state = state.copyWith(category: category);
  void updateDate(String date) => state = state.copyWith(dateStr: date);
  void toggleTimeRequired(bool required) => state = state.copyWith(timeRequired: required);
  void updateTime(String time) => state = state.copyWith(timeStr: time);
  void updateRepeat(String repeat) => state = state.copyWith(repeat: repeat);
  void updateNotificationType(String type) => state = state.copyWith(notificationType: type);
}

final createReminderProvider =
    StateNotifierProvider.autoDispose<CreateReminderNotifier, CreateReminderState>((ref) {
  return CreateReminderNotifier();
});
