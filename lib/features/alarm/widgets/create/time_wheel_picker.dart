import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../providers/create_alarm_provider.dart';

class TimeWheelPicker extends ConsumerStatefulWidget {
  const TimeWheelPicker({super.key});

  @override
  ConsumerState<TimeWheelPicker> createState() => _TimeWheelPickerState();
}

class _TimeWheelPickerState extends ConsumerState<TimeWheelPicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _amPmController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(createAlarmProvider);
    _hourController = FixedExtentScrollController(initialItem: state.hour == 12 ? 11 : (state.hour % 12) - 1);
    _minuteController = FixedExtentScrollController(initialItem: state.minute);
    _amPmController = FixedExtentScrollController(initialItem: state.isAm ? 0 : 1);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _amPmController.dispose();
    super.dispose();
  }

  void _updateTime() {
    final state = ref.read(createAlarmProvider);
    
    // Hour index 0..11 represents 1..12
    int selectedHour = (_hourController.selectedItem % 12) + 1;
    int selectedMinute = _minuteController.selectedItem % 60;
    bool isAm = _amPmController.selectedItem == 0;

    if (state.hour != selectedHour || state.minute != selectedMinute || state.isAm != isAm) {
      ref.read(createAlarmProvider.notifier).updateTime(selectedHour, selectedMinute, isAm);
    }
  }

  Widget _buildWheel({
    required FixedExtentScrollController controller,
    required int itemCount,
    required String Function(int index) itemString,
    bool isAmPm = false,
  }) {
    return SizedBox(
      width: isAmPm ? 80 : 100,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 80,
        physics: const FixedExtentScrollPhysics(),
        perspective: 0.005,
        squeeze: 1.2,
        onSelectedItemChanged: (_) => _updateTime(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            // For infinite looping (except AM/PM)
            final realIndex = isAmPm ? index : (index % itemCount);
            if (isAmPm && (index < 0 || index > 1)) return null;

            return Consumer(
              builder: (context, ref, child) {
                // Determine if this item is selected to handle text style dynamically
                final isSelected = controller.hasClients 
                    ? controller.selectedItem == index 
                    : controller.initialItem == index;

                final textStyle = isSelected
                    ? Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                        )
                    : Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 48,
                          color: AppTheme.disabledText.withOpacity(0.5),
                        );

                return Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 250),
                    style: textStyle!,
                    child: Text(itemString(realIndex)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Center Indicator lines
          Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppTheme.borderColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWheel(
                controller: _hourController,
                itemCount: 12,
                itemString: (index) => (index + 1).toString().padLeft(2, '0'),
              ),
              Text(
                ':',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryText,
                    ),
              ),
              _buildWheel(
                controller: _minuteController,
                itemCount: 60,
                itemString: (index) => index.toString().padLeft(2, '0'),
              ),
              _buildWheel(
                controller: _amPmController,
                itemCount: 2,
                isAmPm: true,
                itemString: (index) => index == 0 ? 'AM' : 'PM',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
