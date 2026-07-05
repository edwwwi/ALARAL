import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsightTimelineEvent {
  final String emoji;
  final String title;
  final String action;
  final String time;
  final String status;

  InsightTimelineEvent({
    required this.emoji,
    required this.title,
    required this.action,
    required this.time,
    required this.status,
  });
}

class Achievement {
  final String emoji;
  final String title;
  final bool isUnlocked;
  final double progress;

  Achievement({
    required this.emoji,
    required this.title,
    required this.isUnlocked,
    required this.progress,
  });
}

class InsightsState {
  // Today Summary
  final int overallScore;
  final String scoreLabel;
  final String todayMessage;
  final String sleepStat;
  final String waterStat;
  final String remindersStat;
  final String alarmStat;
  final String completionPercent;

  // Quick Metrics
  final String avgSleep;
  final String avgWater;
  final String reminderCompletion;
  final String alarmConsistency;

  // Monthly Insights
  final String bestWeek;
  final String worstWeek;
  final String sleepConsistency;
  final String waterConsistency;

  // Streaks
  final int sleepStreak;
  final int waterStreak;
  final int alarmStreak;
  final int reminderStreak;

  // Timeline
  final List<InsightTimelineEvent> timeline;

  // Generated Text
  final List<String> aiInsights;
  final List<String> recommendations;

  // Achievements
  final List<Achievement> achievements;

  // Productivity
  final int productivityScore;
  final String productivityLabel;

  InsightsState({
    required this.overallScore,
    required this.scoreLabel,
    required this.todayMessage,
    required this.sleepStat,
    required this.waterStat,
    required this.remindersStat,
    required this.alarmStat,
    required this.completionPercent,
    required this.avgSleep,
    required this.avgWater,
    required this.reminderCompletion,
    required this.alarmConsistency,
    required this.bestWeek,
    required this.worstWeek,
    required this.sleepConsistency,
    required this.waterConsistency,
    required this.sleepStreak,
    required this.waterStreak,
    required this.alarmStreak,
    required this.reminderStreak,
    required this.timeline,
    required this.aiInsights,
    required this.recommendations,
    required this.achievements,
    required this.productivityScore,
    required this.productivityLabel,
  });
}

class InsightsNotifier extends StateNotifier<InsightsState> {
  InsightsNotifier() : super(_mockData());

  static InsightsState _mockData() {
    return InsightsState(
      overallScore: 92,
      scoreLabel: 'Excellent Day',
      todayMessage: 'You are ahead of your weekly average.',
      sleepStat: '7h 48m',
      waterStat: '2.4L',
      remindersStat: '4/5',
      alarmStat: 'On Time',
      completionPercent: '94%',
      avgSleep: '7h 36m',
      avgWater: '2.8L',
      reminderCompletion: '96%',
      alarmConsistency: '98%',
      bestWeek: 'Week 2, July',
      worstWeek: 'Week 4, June',
      sleepConsistency: '91%',
      waterConsistency: '88%',
      sleepStreak: 18,
      waterStreak: 11,
      alarmStreak: 32,
      reminderStreak: 26,
      timeline: [
        InsightTimelineEvent(emoji: '📅', title: 'Meeting', action: 'Completed', time: '10:30 AM', status: '✔ Completed'),
        InsightTimelineEvent(emoji: '⏰', title: 'Alarm', action: 'Dismissed', time: '06:30 AM', status: 'Dismissed'),
        InsightTimelineEvent(emoji: '💧', title: 'Drink Water', action: 'Completed', time: '07:00 AM', status: '✔ Completed'),
        InsightTimelineEvent(emoji: '🌙', title: 'Slept', action: '7h 42m', time: '11:15 PM', status: 'Logged'),
      ],
      aiInsights: [
        'You have improved your sleep by 34 minutes this month.',
        'Your hydration is strongest on weekends.',
        'Monday alarms are your most consistent.',
        'You usually miss reminders after 8 PM.',
        'You are only 12 minutes away from your ideal bedtime.',
      ],
      recommendations: [
        'Go to bed before 10:45 PM.',
        'Drink another 600ml today.',
        'Create tomorrow\'s alarm now.',
        'Complete one remaining reminder.',
        'Maintain your 18-day sleep streak.',
      ],
      achievements: [
        Achievement(emoji: '🏆', title: '7 Days of Perfect Sleep', isUnlocked: true, progress: 1.0),
        Achievement(emoji: '💧', title: '30 Hydration Goals', isUnlocked: false, progress: 0.8),
        Achievement(emoji: '⏰', title: '100 On-Time Alarms', isUnlocked: false, progress: 0.45),
        Achievement(emoji: '📅', title: '50 Completed Reminders', isUnlocked: true, progress: 1.0),
      ],
      productivityScore: 87,
      productivityLabel: 'Good',
    );
  }
}

final insightsProvider = StateNotifierProvider.autoDispose<InsightsNotifier, InsightsState>((ref) {
  return InsightsNotifier();
});
