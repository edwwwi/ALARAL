import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../../providers/create_alarm_provider.dart';

class AlarmPreviewCard extends ConsumerWidget {
  const AlarmPreviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAlarmProvider);
    final theme = Theme.of(context).textTheme;

    String timeStr = '${state.hour.toString().padLeft(2, '0')}:${state.minute.toString().padLeft(2, '0')} ${state.isAm ? 'AM' : 'PM'}';
    String repeatStr = _getRepeatString(state.repeatDays);
    String labelStr = state.label.isEmpty ? 'No Label' : state.label;

    return Container(
      padding: const EdgeInsets.all(AppLayout.padH),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: AppLayout.borderL,
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeStr,
                    style: theme.displayLarge?.copyWith(fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: -1),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tomorrow • Tuesday', // Mock for now, would calculate based on current day and repeat
                    style: theme.bodyMedium,
                  ),
                ],
              ),
              const Icon(Icons.alarm_rounded, color: AppTheme.secondaryText, size: 32),
            ],
          ),
          const SizedBox(height: AppLayout.gap16),
          const Divider(),
          const SizedBox(height: AppLayout.gap16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDetailItem('Label', labelStr, theme),
              _buildDetailItem('Repeat', repeatStr, theme, crossAxisAlignment: CrossAxisAlignment.end),
            ],
          ),
          const SizedBox(height: AppLayout.gap16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.success.withOpacity(0.1),
              borderRadius: AppLayout.borderS,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.hourglass_empty_rounded, size: 16, color: AppTheme.success),
                const SizedBox(width: 6),
                Text(
                  'Rings in 8 Hours 24 Minutes', // Mock
                  style: theme.labelSmall?.copyWith(color: AppTheme.success, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailItem(String title, String value, TextTheme theme, {CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: theme.labelSmall?.copyWith(color: AppTheme.disabledText)),
        const SizedBox(height: 2),
        Text(value, style: theme.bodyLarge),
      ],
    );
  }

  String _getRepeatString(List<int> days) {
    if (days.isEmpty) return 'One Time';
    if (days.length == 7) return 'Daily';
    if (days.length == 5 && days.contains(1) && days.contains(5)) return 'Weekdays';
    if (days.length == 2 && days.contains(6) && days.contains(7)) return 'Weekends';
    return '${days.length} days'; // Simplified mock
  }
}
