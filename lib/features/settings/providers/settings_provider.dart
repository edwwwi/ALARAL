import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSettings {
  // Appearance
  final String theme;
  final String accentStyle;
  final String contrast;
  final String fontSize;
  final bool enableAnimations;
  final bool reduceMotion;

  // Alarm
  final String defaultAlarmSound;
  final String defaultSnooze;
  final bool gradualVolume;
  final String defaultRepeat;
  final bool defaultVibration;
  final String missionDefault;
  final String weekendBehaviour;
  final String holidayBehaviour;
  final bool autoDisableAfterRing;

  // Reminder
  final String defaultReminderType;
  final String reminderSound;
  final String defaultNotificationTime;
  final bool persistentNotifications;
  final bool emojiSuggestions;
  final String defaultCategory;
  final bool archiveCompleted;

  // Sleep
  final String preferredSleepGoal;
  final String sleepDetectionMode;
  final bool showSleepScore;
  final bool sleepInsights;
  final bool bedtimeReminder;

  // Hydration
  final String dailyWaterGoal;
  final bool smartGoal;
  final bool weightBased;
  final String reminderFrequency;
  final String reminderTimeRange;
  final bool smartNotifications;

  // Notifications
  final bool masterNotification;
  final bool notifyAlarm;
  final bool notifyReminder;
  final bool notifyWater;
  final bool notifySleep;
  final bool notifyAchievements;
  final bool notifyAppUpdates;

  // Privacy
  final bool localDataOnly;
  final bool analytics;
  final bool crashReports;
  final bool usageStatistics;

  // Accessibility
  final bool highContrast;
  final bool largeButtons;
  final bool screenReaderSupport;
  final bool vibrationFeedback;

  // Developer
  final bool debugMode;
  final bool mockData;

  AppSettings({
    required this.theme,
    required this.accentStyle,
    required this.contrast,
    required this.fontSize,
    required this.enableAnimations,
    required this.reduceMotion,
    required this.defaultAlarmSound,
    required this.defaultSnooze,
    required this.gradualVolume,
    required this.defaultRepeat,
    required this.defaultVibration,
    required this.missionDefault,
    required this.weekendBehaviour,
    required this.holidayBehaviour,
    required this.autoDisableAfterRing,
    required this.defaultReminderType,
    required this.reminderSound,
    required this.defaultNotificationTime,
    required this.persistentNotifications,
    required this.emojiSuggestions,
    required this.defaultCategory,
    required this.archiveCompleted,
    required this.preferredSleepGoal,
    required this.sleepDetectionMode,
    required this.showSleepScore,
    required this.sleepInsights,
    required this.bedtimeReminder,
    required this.dailyWaterGoal,
    required this.smartGoal,
    required this.weightBased,
    required this.reminderFrequency,
    required this.reminderTimeRange,
    required this.smartNotifications,
    required this.masterNotification,
    required this.notifyAlarm,
    required this.notifyReminder,
    required this.notifyWater,
    required this.notifySleep,
    required this.notifyAchievements,
    required this.notifyAppUpdates,
    required this.localDataOnly,
    required this.analytics,
    required this.crashReports,
    required this.usageStatistics,
    required this.highContrast,
    required this.largeButtons,
    required this.screenReaderSupport,
    required this.vibrationFeedback,
    required this.debugMode,
    required this.mockData,
  });

  AppSettings copyWith({
    String? theme,
    String? accentStyle,
    String? contrast,
    String? fontSize,
    bool? enableAnimations,
    bool? reduceMotion,
    String? defaultAlarmSound,
    String? defaultSnooze,
    bool? gradualVolume,
    String? defaultRepeat,
    bool? defaultVibration,
    String? missionDefault,
    String? weekendBehaviour,
    String? holidayBehaviour,
    bool? autoDisableAfterRing,
    String? defaultReminderType,
    String? reminderSound,
    String? defaultNotificationTime,
    bool? persistentNotifications,
    bool? emojiSuggestions,
    String? defaultCategory,
    bool? archiveCompleted,
    String? preferredSleepGoal,
    String? sleepDetectionMode,
    bool? showSleepScore,
    bool? sleepInsights,
    bool? bedtimeReminder,
    String? dailyWaterGoal,
    bool? smartGoal,
    bool? weightBased,
    String? reminderFrequency,
    String? reminderTimeRange,
    bool? smartNotifications,
    bool? masterNotification,
    bool? notifyAlarm,
    bool? notifyReminder,
    bool? notifyWater,
    bool? notifySleep,
    bool? notifyAchievements,
    bool? notifyAppUpdates,
    bool? localDataOnly,
    bool? analytics,
    bool? crashReports,
    bool? usageStatistics,
    bool? highContrast,
    bool? largeButtons,
    bool? screenReaderSupport,
    bool? vibrationFeedback,
    bool? debugMode,
    bool? mockData,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
      accentStyle: accentStyle ?? this.accentStyle,
      contrast: contrast ?? this.contrast,
      fontSize: fontSize ?? this.fontSize,
      enableAnimations: enableAnimations ?? this.enableAnimations,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      defaultAlarmSound: defaultAlarmSound ?? this.defaultAlarmSound,
      defaultSnooze: defaultSnooze ?? this.defaultSnooze,
      gradualVolume: gradualVolume ?? this.gradualVolume,
      defaultRepeat: defaultRepeat ?? this.defaultRepeat,
      defaultVibration: defaultVibration ?? this.defaultVibration,
      missionDefault: missionDefault ?? this.missionDefault,
      weekendBehaviour: weekendBehaviour ?? this.weekendBehaviour,
      holidayBehaviour: holidayBehaviour ?? this.holidayBehaviour,
      autoDisableAfterRing: autoDisableAfterRing ?? this.autoDisableAfterRing,
      defaultReminderType: defaultReminderType ?? this.defaultReminderType,
      reminderSound: reminderSound ?? this.reminderSound,
      defaultNotificationTime: defaultNotificationTime ?? this.defaultNotificationTime,
      persistentNotifications: persistentNotifications ?? this.persistentNotifications,
      emojiSuggestions: emojiSuggestions ?? this.emojiSuggestions,
      defaultCategory: defaultCategory ?? this.defaultCategory,
      archiveCompleted: archiveCompleted ?? this.archiveCompleted,
      preferredSleepGoal: preferredSleepGoal ?? this.preferredSleepGoal,
      sleepDetectionMode: sleepDetectionMode ?? this.sleepDetectionMode,
      showSleepScore: showSleepScore ?? this.showSleepScore,
      sleepInsights: sleepInsights ?? this.sleepInsights,
      bedtimeReminder: bedtimeReminder ?? this.bedtimeReminder,
      dailyWaterGoal: dailyWaterGoal ?? this.dailyWaterGoal,
      smartGoal: smartGoal ?? this.smartGoal,
      weightBased: weightBased ?? this.weightBased,
      reminderFrequency: reminderFrequency ?? this.reminderFrequency,
      reminderTimeRange: reminderTimeRange ?? this.reminderTimeRange,
      smartNotifications: smartNotifications ?? this.smartNotifications,
      masterNotification: masterNotification ?? this.masterNotification,
      notifyAlarm: notifyAlarm ?? this.notifyAlarm,
      notifyReminder: notifyReminder ?? this.notifyReminder,
      notifyWater: notifyWater ?? this.notifyWater,
      notifySleep: notifySleep ?? this.notifySleep,
      notifyAchievements: notifyAchievements ?? this.notifyAchievements,
      notifyAppUpdates: notifyAppUpdates ?? this.notifyAppUpdates,
      localDataOnly: localDataOnly ?? this.localDataOnly,
      analytics: analytics ?? this.analytics,
      crashReports: crashReports ?? this.crashReports,
      usageStatistics: usageStatistics ?? this.usageStatistics,
      highContrast: highContrast ?? this.highContrast,
      largeButtons: largeButtons ?? this.largeButtons,
      screenReaderSupport: screenReaderSupport ?? this.screenReaderSupport,
      vibrationFeedback: vibrationFeedback ?? this.vibrationFeedback,
      debugMode: debugMode ?? this.debugMode,
      mockData: mockData ?? this.mockData,
    );
  }
}

class SettingsNotifier extends StateNotifier<AppSettings> {
  SettingsNotifier() : super(_initialSettings());

  static AppSettings _initialSettings() {
    return AppSettings(
      theme: 'Dark (Default)',
      accentStyle: 'Minimal',
      contrast: 'Normal',
      fontSize: 'Medium',
      enableAnimations: true,
      reduceMotion: false,
      defaultAlarmSound: 'Gentle Sunrise',
      defaultSnooze: '10 Minutes',
      gradualVolume: true,
      defaultRepeat: 'Weekdays',
      defaultVibration: true,
      missionDefault: 'None',
      weekendBehaviour: 'Skip Auto',
      holidayBehaviour: 'Silent',
      autoDisableAfterRing: false,
      defaultReminderType: 'Notification',
      reminderSound: 'Default Chime',
      defaultNotificationTime: '09:00 AM',
      persistentNotifications: false,
      emojiSuggestions: true,
      defaultCategory: 'Personal',
      archiveCompleted: true,
      preferredSleepGoal: '8h',
      sleepDetectionMode: 'Estimated',
      showSleepScore: true,
      sleepInsights: true,
      bedtimeReminder: true,
      dailyWaterGoal: '3.0L',
      smartGoal: true,
      weightBased: false,
      reminderFrequency: 'Smart',
      reminderTimeRange: '8AM - 10PM',
      smartNotifications: true,
      masterNotification: true,
      notifyAlarm: true,
      notifyReminder: true,
      notifyWater: true,
      notifySleep: true,
      notifyAchievements: true,
      notifyAppUpdates: false,
      localDataOnly: true,
      analytics: false,
      crashReports: false,
      usageStatistics: false,
      highContrast: false,
      largeButtons: false,
      screenReaderSupport: false,
      vibrationFeedback: true,
      debugMode: false,
      mockData: true,
    );
  }

  void updateSetting<T>(String key, T value) {
    // In a real app, this would use a key-value store or switch statement.
    // Since this is mock UI, we will just force a rebuild with standard toggle method for demo purposes.
  }

  void toggle(bool Function(AppSettings) selector, AppSettings Function(AppSettings, bool) updater) {
    state = updater(state, !selector(state));
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  return SettingsNotifier();
});
