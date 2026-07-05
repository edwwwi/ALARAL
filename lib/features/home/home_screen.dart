import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'providers/time_provider.dart';
import 'providers/daily_summary_provider.dart';
import '../alarm/providers/alarm_provider.dart';
import '../../core/database/models/alarm_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(currentTimeProvider);
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildClockSection(context, currentTime, theme),
            const SizedBox(height: 32),
            const Divider(color: Color(0xFF333333), thickness: 1),
            const SizedBox(height: 32),
            _buildSectionTitle('Active Alarm', theme),
            const SizedBox(height: 16),
            _buildNextAlarmCard(context, ref, theme),
            const SizedBox(height: 32),
            _buildSectionTitle('Dashboard', theme),
            const SizedBox(height: 16),
            _buildDashboardGrid(context, ref, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildClockSection(BuildContext context, DateTime time, ThemeData theme) {
    return Column(
      children: [
        Text(
          DateFormat('HH:mm:ss').format(time),
          style: theme.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          DateFormat('EEEE, MMMM d').format(time),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildNextAlarmCard(BuildContext context, WidgetRef ref, ThemeData theme) {
    final nextAlarmState = ref.watch(nextActiveAlarmProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: nextAlarmState.when(
          data: (AlarmModel? alarm) {
            if (alarm == null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('No Active Alarms', style: theme.textTheme.headlineSmall),
                ],
              );
            }
            final isTomorrow = alarm.time.day != DateTime.now().day;
            final label = isTomorrow ? 'Tomorrow' : 'Today';
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('hh:mm a').format(alarm.time),
                      style: theme.textTheme.headlineLarge,
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
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
          error: (err, stack) => Text('Error loading alarms'),
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(BuildContext context, WidgetRef ref, ThemeData theme) {
    final summaryState = ref.watch(dailySummaryProvider);

    return summaryState.when(
      data: (summary) {
        final sleepVal = summary != null ? '\${summary.sleepMinutes ~/ 60}h \${summary.sleepMinutes % 60}m' : '0h 0m';
        final sleepScore = summary?.overallScore ?? 0;
        final waterVal = summary != null ? '\${(summary.waterMl / 1000).toStringAsFixed(1)}L' : '0.0L';
        final reminders = summary?.remindersCompleted ?? 0;

        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            _buildMetricCard(
              theme,
              title: 'Sleep (LIVE)',
              value: sleepVal,
              subtitle: 'Score: \$sleepScore',
              icon: Icons.bedtime_rounded,
            ),
            _buildMetricCard(
              theme,
              title: 'Water (LIVE)',
              value: waterVal,
              subtitle: 'Logged today',
              icon: Icons.water_drop_rounded,
            ),
            _buildMetricCard(
              theme,
              title: 'Tasks',
              value: '\$reminders completed',
              subtitle: 'For today',
              icon: Icons.task_alt_rounded,
            ),
            _buildMetricCard(
              theme,
              title: 'History',
              value: 'View',
              subtitle: 'Last 5 alarms',
              icon: Icons.history_rounded,
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
      error: (err, stack) => Text('Error: \$err'),
    );
  }

  Widget _buildMetricCard(ThemeData theme,
      {required String title, required String value, required String subtitle, required IconData icon}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(fit: BoxFit.scaleDown, child: Text(title, style: theme.textTheme.labelSmall)),
                  const SizedBox(height: 4),
                  FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: theme.textTheme.titleLarge)),
                  const SizedBox(height: 2),
                  FittedBox(fit: BoxFit.scaleDown, child: Text(subtitle, style: theme.textTheme.labelSmall?.copyWith(fontSize: 11))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
