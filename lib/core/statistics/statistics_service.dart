import '../database/repositories/alarm_repository.dart';
import '../database/repositories/reminder_repository.dart';
import '../database/repositories/sleep_repository.dart';
import '../database/repositories/water_repository.dart';
import 'score_calculator.dart';

/// Facade for querying raw datasets over time boundaries and orchestrating score calculations.
class StatisticsService {
  final AlarmRepository alarmRepo;
  final ReminderRepository reminderRepo;
  final SleepRepository sleepRepo;
  final WaterRepository waterRepo;
  final ScoreCalculator calculator;

  StatisticsService({
    required this.alarmRepo,
    required this.reminderRepo,
    required this.sleepRepo,
    required this.waterRepo,
    required this.calculator,
  });

  /// Gathers all metrics for the current day and generates a composite score.
  Future<Map<String, dynamic>> getDailyStats(DateTime date) async {
    // 1. Fetch raw data from repos for [date]
    // 2. Pass to calculator
    // 3. Return aggregated map of scores
    return {};
  }

  /// Gathers all metrics for the past 7 days and generates weekly averages.
  Future<Map<String, dynamic>> getWeeklyStats(DateTime startDate) async {
    return {};
  }

  /// Calculates the user's current streak of meeting their overall daily goals.
  Future<int> calculateCurrentStreak() async {
    // Traverse DailySummaryModel history backwards until a missed goal is found
    return 0;
  }

  /// Finds the highest streak achieved in history.
  Future<int> calculateLongestStreak() async {
    return 0;
  }
}
