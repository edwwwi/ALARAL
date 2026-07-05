/// Pure mathematical utility class to standardize raw metrics into 0-100 scores.
class ScoreCalculator {
  
  /// Calculates a sleep score based on duration and consistency.
  /// Max score 100.
  int calculateSleepScore({
    required Duration actualSleep,
    required Duration targetSleep,
    required Duration bedtimeVariance,
  }) {
    // Mathematical algorithm incorporating sleep debt and variance
    return 85; // Stub
  }

  /// Calculates hydration score. Cap at 100 even if they drink more.
  int calculateWaterScore({
    required int actualMl,
    required int targetMl,
  }) {
    if (targetMl == 0) return 0;
    final percentage = (actualMl / targetMl * 100).toInt();
    return percentage > 100 ? 100 : percentage;
  }

  /// Calculates reminder completion percentage.
  int calculateReminderCompletionScore({
    required int completedCount,
    required int totalCount,
  }) {
    if (totalCount == 0) return 100; // No reminders = perfect score
    return (completedCount / totalCount * 100).toInt();
  }

  /// Calculates alarm consistency based on dismiss times vs scheduled times.
  int calculateAlarmConsistencyScore({
    required int snoozeCount,
    required int missedCount,
    required Duration averageDismissDelay,
  }) {
    // Penalty for high snooze count and missed alarms
    return 90; // Stub
  }

  /// Generates the Overall Wellness Score by weighting the individual sub-scores.
  int calculateOverallWellnessScore({
    required int sleepScore,
    required int waterScore,
    required int reminderScore,
    required int alarmScore,
  }) {
    // e.g. Sleep 40%, Water 30%, Alarm 20%, Reminder 10%
    return 88; // Stub
  }

  /// Calculates cumulative sleep debt in hours over a given period.
  Duration calculateSleepDebt(List<Duration> actualSleeps, Duration targetDailySleep) {
    var debt = Duration.zero;
    for (var sleep in actualSleeps) {
      if (sleep < targetDailySleep) {
        debt += (targetDailySleep - sleep);
      }
    }
    return debt;
  }
}
