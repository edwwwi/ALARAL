import 'package:isar/isar.dart';
import '../models/user_settings_model.dart';

class SettingsRepository {
  final Isar isar;

  SettingsRepository(this.isar);

  Future<UserSettingsModel> getSettings() async {
    final settings = await isar.userSettingsModels.where().findFirst();
    if (settings != null) {
      return settings;
    }
    
    // Create default settings if not exists
    final defaultSettings = UserSettingsModel();
    await isar.writeTxn(() async {
      await isar.userSettingsModels.put(defaultSettings);
    });
    return defaultSettings;
  }

  Future<int> updateSettings(UserSettingsModel settings) async {
    return await isar.writeTxn(() async {
      settings.updatedAt = DateTime.now();
      return await isar.userSettingsModels.put(settings);
    });
  }
}
