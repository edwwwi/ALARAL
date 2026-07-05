import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_layout.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/alarm.dart';
import '../providers/mock_alarm_provider.dart';

class ActiveAlarmCard extends ConsumerWidget {
  const ActiveAlarmCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextAlarm = ref.watch(nextActiveAlarmProvider);
    final hasActiveAlarm = nextAlarm != null;

    return AnimatedContainer(
      duration: AppLayout.animDuration,
      curve: AppLayout.animCurve,
      height: hasActiveAlarm ? 180 : 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: AppLayout.borderL,
        border: Border.all(
          color: hasActiveAlarm ? AppTheme.primaryText.withOpacity(0.1) : AppTheme.borderColor,
          width: 1,
        ),
        boxShadow: hasActiveAlarm
            ? [
                BoxShadow(
                  color: AppTheme.primaryText.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ]
            : [],
      ),
      child: AnimatedSwitcher(
        duration: AppLayout.animDuration,
        child: hasActiveAlarm
            ? _buildActiveContent(context, ref, nextAlarm)
            : _buildEmptyState(context),
      ),
    );
  }

  Widget _buildActiveContent(BuildContext context, WidgetRef ref, Alarm alarm) {
    final theme = Theme.of(context).textTheme;
    final timeStr = DateFormat('hh:mm').format(alarm.time);
    final amPmStr = DateFormat('a').format(alarm.time);

    return Padding(
      padding: const EdgeInsets.all(AppLayout.padH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        timeStr,
                        style: theme.displayLarge?.copyWith(fontSize: 48, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        amPmStr,
                        style: theme.titleMedium?.copyWith(color: AppTheme.secondaryText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tomorrow • ${DateFormat('EEEE').format(alarm.time)}',
                    style: theme.bodyMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    alarm.label,
                    style: theme.labelSmall?.copyWith(color: AppTheme.primaryText),
                  ),
                ],
              ),
              Switch(
                value: alarm.isActive,
                onChanged: (val) {
                  ref.read(mockAlarmProvider.notifier).toggleAlarm(alarm.id);
                },
                activeColor: Colors.black,
                activeTrackColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: AppTheme.secondaryBackground,
              ),
            ],
          ),
          Text(
            'Rings in 8 Hours 42 Minutes',
            style: theme.labelSmall?.copyWith(color: AppTheme.success),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(AppLayout.padH),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.alarm_off_rounded, size: 40, color: AppTheme.disabledText),
          const SizedBox(height: AppLayout.gap16),
          Text(
            'No Active Alarm',
            style: theme.titleMedium?.copyWith(color: AppTheme.secondaryText),
          ),
          const SizedBox(height: 4),
          Text(
            'Your next alarm will appear here.',
            style: theme.labelSmall,
          ),
        ],
      ),
    );
  }
}
