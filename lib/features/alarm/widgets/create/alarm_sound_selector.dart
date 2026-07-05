import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_title.dart';
import '../../providers/create_alarm_provider.dart';

class AlarmSoundSelector extends ConsumerWidget {
  const AlarmSoundSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAlarmProvider);

    final sounds = [
      'Gentle Sunrise',
      'Ocean',
      'Classic Bell',
      'Digital',
      'Minimal Chime',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Alarm Sound'),
        Container(
          padding: const EdgeInsets.all(AppLayout.padH),
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: AppLayout.borderL,
            border: Border.all(color: AppTheme.borderColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.music_note_rounded, color: AppTheme.secondaryText),
                      const SizedBox(width: AppLayout.gap16),
                      Text(
                        state.ringtone,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Icon(Icons.play_circle_fill_rounded, color: AppTheme.accent),
                ],
              ),
              const SizedBox(height: AppLayout.gap16),
              const Divider(),
              const SizedBox(height: AppLayout.gap16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: sounds.map((sound) {
                    final isSelected = sound == state.ringtone;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () => ref.read(createAlarmProvider.notifier).updateSound(sound),
                        child: AnimatedContainer(
                          duration: AppLayout.animDuration,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? AppTheme.accent : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected ? Colors.transparent : AppTheme.borderColor,
                            ),
                          ),
                          child: Text(
                            sound,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isSelected ? Colors.black : AppTheme.secondaryText,
                                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                                ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: AppLayout.gap16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Increase Volume Gradually',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: Colors.black,
                    activeTrackColor: Colors.white,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: AppTheme.secondaryBackground,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
