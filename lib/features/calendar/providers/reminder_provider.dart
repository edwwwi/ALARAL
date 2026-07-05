import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/dependency_providers.dart';
import '../../../core/database/models/reminder_model.dart';

final activeRemindersProvider = FutureProvider<List<ReminderModel>>((ref) async {
  final repo = await ref.watch(reminderRepositoryProvider.future);
  return await repo.getActiveReminders();
});

final addReminderProvider = Provider((ref) => (ReminderModel reminder) async {
  final repo = await ref.read(reminderRepositoryProvider.future);
  await repo.createReminder(reminder);
  ref.invalidate(activeRemindersProvider);
});
