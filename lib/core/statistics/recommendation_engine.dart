import 'insight_service.dart';

/// Translates raw scores and trends into human-readable, actionable advice strings.
/// Operates on a rules-based deterministic system.
class RecommendationEngine {
  final InsightService insightService;

  RecommendationEngine(this.insightService);

  /// Generates a list of actionable advice strings for today.
  List<String> generateDailyRecommendations({
    required int currentWaterMl,
    required int targetWaterMl,
    required Duration sleepDebt,
    required int missedReminders,
  }) {
    final recommendations = <String>[];

    if (currentWaterMl < targetWaterMl) {
      final diff = targetWaterMl - currentWaterMl;
      recommendations.add('Drink \${diff}ml more today.');
    }

    if (sleepDebt.inHours > 1) {
      recommendations.add('Go to bed earlier tonight to recover sleep debt.');
    }

    if (missedReminders > 0) {
      recommendations.add('You have \${missedReminders} missed reminders to catch up on.');
    }

    return recommendations;
  }

  /// Generates a summary insight for the past week.
  List<String> generateWeeklyInsights({
    required Map<String, dynamic> thisWeekScores,
    required Map<String, dynamic> lastWeekScores,
  }) {
    final insights = <String>[];
    final trends = insightService.compareWeeklyTrends(
      thisWeek: thisWeekScores, 
      lastWeek: lastWeekScores,
    );

    trends.forEach((metric, trend) {
      if (trend == 'improving') {
        insights.add('\${_capitalize(metric)} improved this week.');
      } else if (trend == 'degrading') {
        insights.add('\${_capitalize(metric)} consistency decreased.');
      }
    });

    return insights;
  }

  String _capitalize(String s) => s.isNotEmpty ? '\${s[0].toUpperCase()}\${s.substring(1)}' : s;
}
