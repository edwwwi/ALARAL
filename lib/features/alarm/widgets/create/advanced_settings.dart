import 'package:flutter/material.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';

class AdvancedSettings extends StatefulWidget {
  const AdvancedSettings({super.key});

  @override
  State<AdvancedSettings> createState() => _AdvancedSettingsState();
}

class _AdvancedSettingsState extends State<AdvancedSettings> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: AppLayout.borderL,
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: AppLayout.padH, vertical: 8),
            title: Text(
              'Advanced Settings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
              color: AppTheme.secondaryText,
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Padding(
              padding: const EdgeInsets.only(left: AppLayout.padH, right: AppLayout.padH, bottom: AppLayout.padV),
              child: Column(
                children: [
                  const Divider(),
                  _buildToggleRow('Flashlight Blink', true),
                  _buildToggleRow('Keep Screen Awake', true),
                  _buildToggleRow('Silent on Holidays', false),
                  _buildToggleRow('Auto Disable After Ring', false),
                  const SizedBox(height: AppLayout.gap16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Battery Optimization',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Unrestricted',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppTheme.success),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: AppLayout.animDuration,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleRow(String title, bool initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Switch(
            value: initialValue,
            onChanged: (val) {}, // Mock
            activeColor: Colors.black,
            activeTrackColor: Colors.white,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: AppTheme.secondaryBackground,
          ),
        ],
      ),
    );
  }
}
