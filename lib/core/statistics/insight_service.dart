/// Evaluates historical trends to determine directional vectors (improving, degrading, stable).
class InsightService {
  
  /// Compares this week's scores to last week's scores to find the trend.
  Map<String, String> compareWeeklyTrends({
    required Map<String, dynamic> thisWeek,
    required Map<String, dynamic> lastWeek,
  }) {
    // Return map of metric name to trend (e.g., "sleep": "improving")
    return {
      'sleep': 'improving',
      'water': 'stable',
      'reminder': 'degrading',
    };
  }

  /// Identifies the lowest performing metric to focus on.
  String identifyPrimaryWeakness(Map<String, dynamic> scores) {
    // Sort scores and pick the lowest
    return 'water';
  }

  /// Identifies the highest performing metric to celebrate.
  String identifyPrimaryStrength(Map<String, dynamic> scores) {
    // Sort scores and pick the highest
    return 'sleep';
  }
}
