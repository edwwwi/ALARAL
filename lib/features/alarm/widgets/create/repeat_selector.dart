import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_title.dart';
import '../../providers/create_alarm_provider.dart';

class RepeatSelector extends ConsumerWidget {
  const RepeatSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAlarmProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Repeat'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            final dayIndex = index + 1; // 1 = Monday, 7 = Sunday
            final isSelected = state.repeatDays.contains(dayIndex);
            final dayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

            return GestureDetector(
              onTap: () {
                ref.read(createAlarmProvider.notifier).toggleRepeatDay(dayIndex);
              },
              child: AnimatedContainer(
                duration: AppLayout.animDuration,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.primaryText : AppTheme.secondaryBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.transparent : AppTheme.borderColor,
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  dayLetters[index],
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.black : AppTheme.primaryText,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: AppLayout.gap16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              _buildPresetChip(context, ref, state.repeatDays, 'One Time', []),
              _buildPresetChip(context, ref, state.repeatDays, 'Daily', [1, 2, 3, 4, 5, 6, 7]),
              _buildPresetChip(context, ref, state.repeatDays, 'Weekdays', [1, 2, 3, 4, 5]),
              _buildPresetChip(context, ref, state.repeatDays, 'Weekends', [6, 7]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPresetChip(
      BuildContext context, WidgetRef ref, List<int> currentDays, String label, List<int> presetDays) {
    // Check if current selection matches preset
    bool isMatch = false;
    if (presetDays.isEmpty && currentDays.isEmpty) {
      isMatch = true;
    } else if (presetDays.length == currentDays.length) {
      isMatch = presetDays.every((d) => currentDays.contains(d));
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          ref.read(createAlarmProvider.notifier).setRepeatPreset(label);
        },
        child: AnimatedContainer(
          duration: AppLayout.animDuration,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isMatch ? AppTheme.cardColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isMatch ? AppTheme.primaryText : AppTheme.borderColor,
            ),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isMatch ? AppTheme.primaryText : AppTheme.secondaryText,
                  fontWeight: isMatch ? FontWeight.w500 : FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
