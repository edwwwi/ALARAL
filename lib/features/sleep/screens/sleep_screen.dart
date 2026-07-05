import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/sleep_provider.dart';
import '../../../core/database/models/sleep_record_model.dart';

class SleepScreen extends ConsumerWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final sleepState = ref.watch(sleepRecordsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sleep',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: sleepState.when(
        data: (records) {
          final todayRecord = records.isNotEmpty ? records.first : null;

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTopCard(theme, todayRecord),
                      const SizedBox(height: 32),
                      _buildRecordingControls(context, ref, theme),
                      const SizedBox(height: 32),
                      Text('Monthly Sleep', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                      _buildMonthlyGrid(theme, records),
                      const SizedBox(height: 32),
                      Text('History', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              if (records.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Text('No sleep data', style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white54)),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildSleepCard(theme, records[index], context),
                      ),
                      childCount: records.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom padding
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
    );
  }

  Widget _buildTopCard(ThemeData theme, SleepRecordModel? record) {
    if (record == null) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF151515),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text('No sleep recorded today.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white54)),
      );
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Sleep", style: theme.textTheme.labelMedium?.copyWith(color: Colors.white54)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Score: \${record.sleepScore}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '\${(record.durationMinutes / 60).toStringAsFixed(1)}h',
            style: theme.textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bed Time', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white54)),
                  Text(DateFormat('hh:mm a').format(record.bedTime), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wake Time', style: theme.textTheme.labelSmall?.copyWith(color: Colors.white54)),
                  Text(DateFormat('hh:mm a').format(record.wakeTime), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecordingControls(BuildContext context, WidgetRef ref, ThemeData theme) {
    // Mocking active tracking state for UI purposes
    final bool isTracking = false; 

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: isTracking ? Colors.transparent : Colors.white,
              foregroundColor: isTracking ? Colors.white : Colors.black,
              side: isTracking ? const BorderSide(color: Colors.white24) : null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {
              if (isTracking) return;
              
              // Simulate starting sleep (in a real app, write start time to preferences)
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sleep Tracking Started')));
            },
            child: Text('Start Sleep', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: isTracking ? Colors.white54 : Colors.black)),
          ),
        ),
        if (isTracking) ...[
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                // Simulate waking up
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sleep Recorded')));
              },
              child: const Text('Wake Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMonthlyGrid(ThemeData theme, List<SleepRecordModel> records) {
    // Generate a basic 7-row grid (similar to GitHub)
    // For simplicity in UI, we'll draw a horizontal scrollable grid
    final now = DateTime.now();
    final List<Widget> columns = [];
    
    // Create 10 weeks of history
    for (int week = 9; week >= 0; week--) {
      final List<Widget> cells = [];
      for (int day = 0; day < 7; day++) {
        final date = now.subtract(Duration(days: week * 7 + day));
        
        // Find record for this day
        final record = records.firstWhere((r) => r.bedTime.year == date.year && r.bedTime.month == date.month && r.bedTime.day == date.day, orElse: () => SleepRecordModel()..durationMinutes = 0);
        
        final hours = record.durationMinutes / 60;
        
        // Intensity calculation
        Color color = Colors.transparent;
        if (hours > 0) {
          if (hours >= 8) color = Colors.white;
          else if (hours >= 6) color = Colors.white70;
          else if (hours >= 4) color = Colors.white38;
          else color = Colors.white24;
        }

        cells.add(
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color,
              border: color == Colors.transparent ? Border.all(color: Colors.white10) : null,
              borderRadius: BorderRadius.circular(4),
            ),
            child: hours > 0 
                ? Center(child: Text('\${hours.toInt()}h', style: const TextStyle(fontSize: 8, color: Colors.black, fontWeight: FontWeight.bold)))
                : null,
          ),
        );
      }
      columns.add(Column(mainAxisSize: MainAxisSize.min, children: cells));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(children: columns),
    );
  }

  Widget _buildSleepCard(ThemeData theme, SleepRecordModel record, BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showSleepDetails(context, theme, record);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF151515),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('EEEE').format(record.bedTime), style: theme.textTheme.labelMedium?.copyWith(color: Colors.white54)),
                const SizedBox(height: 4),
                Text(
                  '\${(record.durationMinutes / 60).toStringAsFixed(1)}h',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "\${DateFormat('hh:mm a').format(record.bedTime)} → \${DateFormat('hh:mm a').format(record.wakeTime)}",
                  style: theme.textTheme.labelSmall?.copyWith(color: Colors.white38),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                '\${record.sleepScore}',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSleepDetails(BuildContext context, ThemeData theme, SleepRecordModel record) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151515),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(DateFormat('EEEE, MMMM d').format(record.bedTime), style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 24),
              _buildDetailRow(theme, 'Bed Time', DateFormat('hh:mm a').format(record.bedTime)),
              const Divider(color: Colors.white12, height: 32),
              _buildDetailRow(theme, 'Wake Time', DateFormat('hh:mm a').format(record.wakeTime)),
              const Divider(color: Colors.white12, height: 32),
              _buildDetailRow(theme, 'Duration', '\${(record.durationMinutes / 60).toStringAsFixed(1)} Hours'),
              const Divider(color: Colors.white12, height: 32),
              _buildDetailRow(theme, 'Sleep Score', '\${record.sleepScore} / 100'),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white10,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Close', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(ThemeData theme, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white54)),
        Text(value, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
