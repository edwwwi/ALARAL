import 'package:permission_handler/permission_handler.dart';

/// Service responsible for managing critical Android 12+ and 13+ permissions
/// ensuring that ALARAL is never restricted from firing alarms.
class PermissionService {
  
  /// Requests POST_NOTIFICATIONS (Android 13+)
  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Checks if POST_NOTIFICATIONS is granted
  Future<bool> hasNotificationPermission() async {
    return await Permission.notification.isGranted;
  }

  /// Requests SCHEDULE_EXACT_ALARM (Android 12+)
  /// Note: Usually required to navigate to settings on Android 14+ if revoked.
  Future<bool> requestExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.request();
    return status.isGranted;
  }

  /// Checks if SCHEDULE_EXACT_ALARM is granted
  Future<bool> hasExactAlarmPermission() async {
    return await Permission.scheduleExactAlarm.isGranted;
  }

  /// Checks if the app is exempt from battery optimizations.
  /// Critical for reliable alarm firing in Doze mode.
  Future<bool> isIgnoringBatteryOptimizations() async {
    return await Permission.ignoreBatteryOptimizations.isGranted;
  }

  /// Requests the user to whitelist the app from battery optimizations.
  Future<bool> requestIgnoreBatteryOptimizations() async {
    final status = await Permission.ignoreBatteryOptimizations.request();
    return status.isGranted;
  }

  /// Composite method to check all critical alarm permissions.
  Future<bool> hasAllCriticalPermissions() async {
    final notif = await hasNotificationPermission();
    final exact = await hasExactAlarmPermission();
    // Battery optimization is recommended but not strictly required for exact alarms 
    // to work in many cases, though highly recommended.
    return notif && exact;
  }
}
