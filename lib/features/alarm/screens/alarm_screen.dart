import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/alarm_provider.dart';
import '../../../core/database/models/alarm_model.dart';

class AlarmScreen extends ConsumerWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final alarmState = ref.watch(alarmNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alarms',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: alarmState.when(
        data: (alarms) {
          if (alarms.isEmpty) {
            return _buildEmptyState(theme);
          }
          return ListView.separated(
            padding: const EdgeInsets.all(24),
            physics: const BouncingScrollPhysics(),
            itemCount: alarms.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final alarm = alarms[index];
              return _buildAlarmCard(context, ref, alarm, theme);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    surface: Color(0xFF1A1A1A),
                    onSurface: Colors.white,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (picked != null) {
            final now = DateTime.now();
            var alarmTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
            if (alarmTime.isBefore(now)) {
              alarmTime = alarmTime.add(const Duration(days: 1));
            }

            final newAlarm = AlarmModel()
              ..time = alarmTime
              ..label = 'Alarm'
              ..enabled = true
              ..sound = 'Default'
              ..vibration = true;

            ref.read(alarmNotifierProvider.notifier).addAlarm(newAlarm);
          }
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.alarm_off_rounded, size: 64, color: theme.colorScheme.secondary),
          const SizedBox(height: 16),
          Text(
            'No Alarms Set',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Press + to add a new alarm',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildAlarmCard(BuildContext context, WidgetRef ref, AlarmModel alarm, ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alarm.label.isEmpty ? 'Alarm' : alarm.label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: alarm.enabled ? Colors.white70 : Colors.white30,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('hh:mm a').format(alarm.time),
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: alarm.enabled ? Colors.white : Colors.white30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatRepeatDays(alarm.repeatDays),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: alarm.enabled ? theme.colorScheme.secondary : Colors.white24,
                  ),
                ),
              ],
            ),
            Switch(
              value: alarm.enabled,
              onChanged: (val) {
                ref.read(alarmNotifierProvider.notifier).toggleAlarm(alarm, val);
              },
              activeColor: Colors.black,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: const Color(0xFF333333),
            ),
          ],
        ),
      ),
    );
  }

  String _formatRepeatDays(List<int> days) {
    if (days.isEmpty) return 'Once';
    if (days.length == 7) return 'Everyday';
    if (days.length == 5 && !days.contains(6) && !days.contains(7)) return 'Weekdays';
    
    final map = {1: 'Mon', 2: 'Tue', 3: 'Wed', 4: 'Thu', 5: 'Fri', 6: 'Sat', 7: 'Sun'};
    return days.map((d) => map[d]).join(', ');
  }
}
