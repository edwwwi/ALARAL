import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineEvent {
  final DateTime date;
  final String action;
  final String status;
  final String description;

  TimelineEvent({
    required this.date,
    required this.action,
    required this.status,
    required this.description,
  });
}

class ReminderDetailsState {
  final String emoji;
  final String title;
  final String category;
  final DateTime nextDate;
  final String repeat;
  final String status;
  
  final int totalOccurrences;
  final int completed;
  final int missed;
  final int currentStreak;
  
  final List<TimelineEvent> timeline;
  final String notes;

  final String completionRate;
  final String averageDelay;
  final int longestStreak;
  final String mostMissedMonth;
  final String preferredTime;

  ReminderDetailsState({
    required this.emoji,
    required this.title,
    required this.category,
    required this.nextDate,
    required this.repeat,
    required this.status,
    required this.totalOccurrences,
    required this.completed,
    required this.missed,
    required this.currentStreak,
    required this.timeline,
    required this.notes,
    required this.completionRate,
    required this.averageDelay,
    required this.longestStreak,
    required this.mostMissedMonth,
    required this.preferredTime,
  });
}

class ReminderDetailsNotifier extends StateNotifier<ReminderDetailsState> {
  ReminderDetailsNotifier() : super(_mockData());

  static ReminderDetailsState _mockData() {
    final now = DateTime.now();
    return ReminderDetailsState(
      emoji: '🎂',
      title: 'Mom\'s Birthday',
      category: 'Personal',
      nextDate: now.add(const Duration(days: 355)),
      repeat: 'Every Year',
      status: 'Active',
      totalOccurrences: 12,
      completed: 11,
      missed: 1,
      currentStreak: 8,
      notes: 'Gift ideas:\n- Spa voucher\n- New gardening tools\n- Books',
      completionRate: '92%',
      averageDelay: '3 Minutes',
      longestStreak: 8,
      mostMissedMonth: 'August',
      preferredTime: '09:03 AM',
      timeline: [
        TimelineEvent(
          date: now.subtract(const Duration(days: 10)),
          action: 'Completed',
          status: '✔ Completed',
          description: 'Completed 2 minutes late',
        ),
        TimelineEvent(
          date: now.subtract(const Duration(days: 375)),
          action: 'Missed',
          status: '⏰ Missed',
          description: 'Missed',
        ),
        TimelineEvent(
          date: now.subtract(const Duration(days: 500)),
          action: 'Edited',
          status: '✏ Edited',
          description: 'Changed reminder time',
        ),
        TimelineEvent(
          date: now.subtract(const Duration(days: 800)),
          action: 'Created',
          status: '➕ Created',
          description: 'Reminder Created',
        ),
      ],
    );
  }
}

final reminderDetailsProvider = StateNotifierProvider.autoDispose<ReminderDetailsNotifier, ReminderDetailsState>((ref) {
  return ReminderDetailsNotifier();
});
