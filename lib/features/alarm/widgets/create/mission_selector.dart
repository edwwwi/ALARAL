import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_title.dart';
import '../../providers/create_alarm_provider.dart';

class MissionSelector extends ConsumerWidget {
  const MissionSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAlarmProvider);
    final theme = Theme.of(context).textTheme;

    final missions = [
      {'title': 'None', 'icon': Icons.block_rounded, 'desc': 'Turn off alarm normally.'},
      {'title': 'Math', 'icon': Icons.calculate_rounded, 'desc': 'Solve three equations before alarm stops.'},
      {'title': 'Shake', 'icon': Icons.vibration_rounded, 'desc': 'Shake your phone vigorously 30 times.'},
      {'title': 'QR Code', 'icon': Icons.qr_code_scanner_rounded, 'desc': 'Scan a specific barcode to stop.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Wake-Up Mission'),
        Column(
          children: missions.map((mission) {
            final isSelected = mission['title'] == state.challengeType;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppLayout.gap16),
              child: GestureDetector(
                onTap: () => ref.read(createAlarmProvider.notifier).updateMission(mission['title'] as String),
                child: AnimatedContainer(
                  duration: AppLayout.animDuration,
                  padding: const EdgeInsets.all(AppLayout.padH),
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.cardColor : AppTheme.secondaryBackground,
                    borderRadius: AppLayout.borderL,
                    border: Border.all(
                      color: isSelected ? AppTheme.accent : AppTheme.borderColor,
                      width: isSelected ? 1.5 : 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(mission['icon'] as IconData, color: isSelected ? AppTheme.accent : AppTheme.secondaryText),
                          const SizedBox(width: AppLayout.gap16),
                          Text(
                            mission['title'] as String,
                            style: theme.bodyLarge?.copyWith(
                              color: isSelected ? AppTheme.primaryText : AppTheme.secondaryText,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      if (isSelected) ...[
                        const SizedBox(height: 12),
                        Text(
                          mission['desc'] as String,
                          style: theme.labelSmall?.copyWith(color: AppTheme.secondaryText),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
