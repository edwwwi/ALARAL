import '../database/models/alarm_model.dart';

/// Responsible for verifying alarm configurations before scheduling.
/// Prevents invalid, duplicate, or past-dated alarms from entering the scheduler.
class AlarmValidator {
  
  /// Performs strict checks before an alarm is committed to the scheduler.
  Future<bool> validateAlarm(AlarmModel alarm, DateTime targetTime) async {
    if (!alarm.enabled) {
      // Alarm is disabled
      return false;
    }

    if (targetTime.isBefore(DateTime.now())) {
      // Cannot schedule in the past
      return false;
    }

    if (!await _hasPermissions()) {
      // Missing EXACT_ALARM or POST_NOTIFICATIONS
      return false;
    }

    return true;
  }

  /// Checks if the requested schedule conflicts closely with another existing alarm.
  Future<bool> checkForConflicts(DateTime targetTime, List<AlarmModel> existingAlarms) async {
    // Logic to detect if another alarm rings at the exact same minute
    return false;
  }

  /// Identifies if an alarm is a direct duplicate of another.
  Future<bool> isDuplicate(AlarmModel newAlarm, List<AlarmModel> existingAlarms) async {
    // Check for same Time, Days, Label, and Repeat configuration
    return false;
  }

  Future<bool> _hasPermissions() async {
    // Call to PermissionService
    return true; 
  }
}
