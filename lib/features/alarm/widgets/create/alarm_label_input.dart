import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/section_title.dart';
import '../../providers/create_alarm_provider.dart';

class AlarmLabelInput extends ConsumerStatefulWidget {
  const AlarmLabelInput({super.key});

  @override
  ConsumerState<AlarmLabelInput> createState() => _AlarmLabelInputState();
}

class _AlarmLabelInputState extends ConsumerState<AlarmLabelInput> {
  late TextEditingController _controller;

  final List<String> _suggestions = [
    'Wake Up',
    'Gym',
    'Meeting',
    'Study',
    'Medicine',
    'Prayer',
    'Birthday',
    'Travel',
    'Work',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: ref.read(createAlarmProvider).label);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onLabelChanged(String value) {
    ref.read(createAlarmProvider.notifier).updateLabel(value);
  }

  void _onSuggestionTapped(String suggestion) {
    _controller.text = suggestion;
    _onLabelChanged(suggestion);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Alarm Label'),
        TextField(
          controller: _controller,
          maxLength: 40,
          onChanged: _onLabelChanged,
          style: Theme.of(context).textTheme.bodyLarge,
          cursorColor: AppTheme.accent,
          decoration: InputDecoration(
            hintText: 'Morning Workout',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.disabledText),
            filled: true,
            fillColor: AppTheme.cardColor,
            contentPadding: const EdgeInsets.all(AppLayout.padH),
            counterText: '', // Hide default counter to keep it minimal
            border: OutlineInputBorder(
              borderRadius: AppLayout.borderL,
              borderSide: const BorderSide(color: AppTheme.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppLayout.borderL,
              borderSide: const BorderSide(color: AppTheme.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppLayout.borderL,
              borderSide: const BorderSide(color: AppTheme.accent, width: 1.5),
            ),
          ),
        ),
        const SizedBox(height: AppLayout.gap16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _suggestions.map((suggestion) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => _onSuggestionTapped(suggestion),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppTheme.secondaryBackground,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.borderColor),
                    ),
                    child: Text(
                      suggestion,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppTheme.secondaryText,
                          ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
