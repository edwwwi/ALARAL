import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'providers/time_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(currentTimeProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildClockSection(context, currentTime, theme),
              const SizedBox(height: 32),
              const Divider(color: Color(0xFF333333), thickness: 1),
              const SizedBox(height: 32),
              _buildSectionTitle('Active Alarm', theme),
              const SizedBox(height: 16),
              _buildNextAlarmCard(theme),
              const SizedBox(height: 32),
              _buildSectionTitle('Dashboard', theme),
              const SizedBox(height: 16),
              _buildDashboardGrid(theme),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildClockSection(BuildContext context, DateTime time, ThemeData theme) {
    return Column(
      children: [
        Text(
          DateFormat('HH:mm:ss').format(time),
          style: theme.textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          DateFormat('EEEE, MMMM d').format(time),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildNextAlarmCard(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tomorrow',
                  style: theme.textTheme.labelSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '06:30 AM',
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
            Switch(
              value: true,
              onChanged: (val) {},
              activeColor: Colors.black,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: const Color(0xFF333333),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardGrid(ThemeData theme) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildMetricCard(
          theme,
          title: 'Sleep',
          value: '7h 20m',
          subtitle: 'Score: 85',
          icon: Icons.bedtime_rounded,
        ),
        _buildMetricCard(
          theme,
          title: 'Water',
          value: '1.2L',
          subtitle: 'Goal: 2.0L',
          icon: Icons.water_drop_rounded,
        ),
        _buildMetricCard(
          theme,
          title: 'Reminders',
          value: '3 tasks',
          subtitle: 'For today',
          icon: Icons.task_alt_rounded,
        ),
        _buildMetricCard(
          theme,
          title: 'History',
          value: 'View',
          subtitle: 'Last 5 alarms',
          icon: Icons.history_rounded,
        ),
      ],
    );
  }

  Widget _buildMetricCard(ThemeData theme,
      {required String title, required String value, required String subtitle, required IconData icon}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.labelSmall),
                const SizedBox(height: 4),
                Text(value, style: theme.textTheme.titleLarge),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: theme.textTheme.labelSmall?.copyWith(fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.alarm_rounded), label: 'Alarm'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
        BottomNavigationBarItem(icon: Icon(Icons.bedtime_rounded), label: 'Sleep'),
        BottomNavigationBarItem(icon: Icon(Icons.water_drop_rounded), label: 'Water'),
      ],
    );
  }
}
