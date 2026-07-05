import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/water_provider.dart';
import '../../../core/database/models/water_entry_model.dart';

class WaterScreen extends ConsumerWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final waterState = ref.watch(waterLogsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hydration',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: waterState.when(
        data: (logs) {
          final totalMl = logs.fold<int>(0, (sum, log) => sum + log.amountMl);
          final goalMl = 2500;
          final progress = (totalMl / goalMl).clamp(0.0, 1.0);

          return Column(
            children: [
              _buildProgressCircle(theme, progress, totalMl, goalMl),
              const SizedBox(height: 32),
              Expanded(
                child: logs.isEmpty
                    ? _buildEmptyState(theme)
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: logs.length,
                        separatorBuilder: (_, __) => const Divider(color: Color(0xFF333333)),
                        itemBuilder: (context, index) {
                          final log = logs[index];
                          return _buildWaterLogTile(theme, log);
                        },
                      ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
        error: (err, stack) => Center(child: Text('Error: \$err')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddWaterBottomSheet(context, ref, theme);
        },
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Water'),
      ),
    );
  }

  void _showAddWaterBottomSheet(BuildContext context, WidgetRef ref, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        int amount = 250;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Log Water', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => setState(() => amount = (amount - 50).clamp(50, 1000)),
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 24),
                      Text('\$amount ml', style: theme.textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 24),
                      IconButton(
                        onPressed: () => setState(() => amount = (amount + 50).clamp(50, 1000)),
                        icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 32),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        ref.read(addWaterProvider)(amount);
                        Navigator.pop(context);
                      },
                      child: const Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProgressCircle(ThemeData theme, double progress, int totalMl, int goalMl) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: const Color(0xFF1A1A1A),
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
              ),
            ),
            Column(
              children: [
                Text(
                  '\${(progress * 100).toInt()}%',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$totalMl / \$goalMl ml',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.water_drop_outlined, size: 48, color: theme.colorScheme.secondary.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            'No water logged today',
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterLogTile(ThemeData theme, WaterEntryModel log) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.water_drop_rounded, color: theme.colorScheme.secondary),
      ),
      title: Text(
        '\${log.amountMl} ml',
        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        log.source,
        style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
      ),
      trailing: Text(
        DateFormat('hh:mm a').format(log.loggedAt),
        style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}
