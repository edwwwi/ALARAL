import 'package:flutter/material.dart';
import '../../../core/theme/app_layout.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/create/time_wheel_picker.dart';
import '../widgets/create/alarm_preview_card.dart';
import '../widgets/create/repeat_selector.dart';
import '../widgets/create/alarm_label_input.dart';
import '../widgets/create/alarm_sound_selector.dart';
import '../widgets/create/mission_selector.dart';
import '../widgets/create/advanced_settings.dart';
import '../widgets/create/save_alarm_button.dart';

class CreateAlarmScreen extends StatelessWidget {
  const CreateAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppLayout.padH),
                child: Column(
                  children: [
                    const SizedBox(height: AppLayout.gap16),
                    const TimeWheelPicker(),
                    const SizedBox(height: AppLayout.gap32),
                    const AlarmPreviewCard(),
                    const SizedBox(height: AppLayout.gap40),
                    const RepeatSelector(),
                    const SizedBox(height: AppLayout.gap40),
                    const AlarmLabelInput(),
                    const SizedBox(height: AppLayout.gap40),
                    const AlarmSoundSelector(),
                    const SizedBox(height: AppLayout.gap40),
                    const MissionSelector(),
                    const SizedBox(height: AppLayout.gap40),
                    const AdvancedSettings(),
                    const SizedBox(height: AppLayout.gap40),
                    const SaveAlarmButton(),
                    const SizedBox(height: 100), // Extra scroll padding at bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppLayout.padH, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_rounded, color: AppTheme.primaryText),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          Text(
            'Create Alarm',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, color: AppTheme.primaryText),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
