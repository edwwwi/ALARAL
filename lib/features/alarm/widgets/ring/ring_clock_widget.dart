import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';

class RingClockWidget extends StatefulWidget {
  const RingClockWidget({super.key});

  @override
  State<RingClockWidget> createState() => _RingClockWidgetState();
}

class _RingClockWidgetState extends State<RingClockWidget> {
  late DateTime _currentTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    
    // Update exactly on the minute mark
    final msUntilNextMinute = 60000 - (_currentTime.second * 1000 + _currentTime.millisecond);
    _timer = Timer(Duration(milliseconds: msUntilNextMinute), _startPeriodicTimer);
  }

  void _startPeriodicTimer() {
    if (mounted) {
      setState(() {
        _currentTime = DateTime.now();
      });
      _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
        setState(() {
          _currentTime = DateTime.now();
        });
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('hh:mm').format(_currentTime);
    final dateStr = DateFormat('EEEE\nd MMMM').format(_currentTime);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Text(
            timeStr,
            key: ValueKey(timeStr),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 80,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -2,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppLayout.gap16),
        Text(
          dateStr,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.secondaryText,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
