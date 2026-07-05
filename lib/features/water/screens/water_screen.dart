import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import '../providers/water_provider.dart';
import '../../../core/database/models/water_entry_model.dart';

class WaterScreen extends ConsumerStatefulWidget {
  const WaterScreen({super.key});

  @override
  ConsumerState<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends ConsumerState<WaterScreen> with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final waterState = ref.watch(waterLogsProvider);

    return Scaffold(
      body: SafeArea(
        child: waterState.when(
          data: (logs) {
            final totalMl = logs.fold<int>(0, (sum, log) => sum + log.amountMl);
            final goalMl = 3000;
            final progress = (totalMl / goalMl).clamp(0.0, 1.0);

            // Sort newest first
            final sortedLogs = List<WaterEntryModel>.from(logs)
              ..sort((a, b) => b.loggedAt.compareTo(a.loggedAt));

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(theme),
                        const SizedBox(height: 32),
                        _buildBottleCenterpiece(theme, progress, totalMl, goalMl),
                        const SizedBox(height: 48),
                        _buildQuickAddControls(theme),
                        const SizedBox(height: 48),
                        _buildProgressCard(theme, totalMl, goalMl),
                        const SizedBox(height: 24),
                        _buildSmartReminder(theme),
                        const SizedBox(height: 48),
                        Text('Timeline', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildTimelineItem(theme, sortedLogs[index]),
                      childCount: sortedLogs.length,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
          error: (err, stack) => Center(child: Text('Error: \$err')),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Center(
      child: Column(
        children: [
          Text(
            DateFormat('d MMMM').format(DateTime.now()),
            style: theme.textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Stay Hydrated',
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _buildBottleCenterpiece(ThemeData theme, double progress, int totalMl, int goalMl) {
    return Center(
      child: SizedBox(
        width: 160,
        height: 320,
        child: AnimatedBuilder(
          animation: _waveController,
          builder: (context, child) {
            return CustomPaint(
              painter: _BottlePainter(
                progress: progress,
                wavePhase: _waveController.value * 2 * math.pi,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat('d MMM').format(DateTime.now()).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\${(totalMl / 1000).toStringAsFixed(1)} L',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '/ \${(goalMl / 1000).toStringAsFixed(1)} L',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuickAddControls(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuickAddButton('+100ml', 100),
        _buildQuickAddButton('+250ml', 250),
        _buildQuickAddButton('+500ml', 500),
        _buildQuickAddButton('Custom', 0),
      ],
    );
  }

  Widget _buildQuickAddButton(String label, int amount) {
    return InkWell(
      onTap: () {
        if (amount > 0) {
          ref.read(addWaterProvider)(amount);
        } else {
          _showCustomAddSheet();
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF151515),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildProgressCard(ThemeData theme, int totalMl, int goalMl) {
    final remaining = (goalMl - totalMl).clamp(0, goalMl);
    final percent = ((totalMl / goalMl) * 100).clamp(0, 100).toInt();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatColumn('Goal', '\${(goalMl / 1000).toStringAsFixed(1)}L'),
          _buildStatColumn('Remaining', '\${(remaining / 1000).toStringAsFixed(1)}L'),
          _buildStatColumn('Completion', '\$percent%'),
          _buildStatColumn('Streak', '12 Days'),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildSmartReminder(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_active_rounded, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Next Reminder', style: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500)),
                const Text('Drink Water in 1 Hour', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(ThemeData theme, WaterEntryModel log) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Text(
            DateFormat('hh:mm a').format(log.loggedAt),
            style: theme.textTheme.labelMedium?.copyWith(color: Colors.white54),
          ),
          const SizedBox(width: 24),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 24),
          Text(
            '\${log.amountMl}ml',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  void _showCustomAddSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF151515),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        int amount = 250;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Custom Amount', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, size: 40, color: Colors.white54),
                        onPressed: () => setState(() => amount = math.max(50, amount - 50)),
                      ),
                      const SizedBox(width: 32),
                      Text('\$amount ml', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 32),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, size: 40, color: Colors.white),
                        onPressed: () => setState(() => amount = math.min(1000, amount + 50)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
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
                      child: const Text('Add Water', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _BottlePainter extends CustomPainter {
  final double progress;
  final double wavePhase;

  _BottlePainter({required this.progress, required this.wavePhase});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    // Define bottle shape
    final path = Path();
    final double neckWidth = size.width * 0.3;
    final double neckHeight = size.height * 0.15;
    final double cornerRadius = 24.0;

    // Start at top left lip
    path.moveTo(size.width / 2 - neckWidth / 2, 0);
    path.lineTo(size.width / 2 + neckWidth / 2, 0);
    
    // Right neck
    path.lineTo(size.width / 2 + neckWidth / 2, neckHeight);
    
    // Right shoulder
    path.quadraticBezierTo(size.width, neckHeight * 1.5, size.width, neckHeight * 2);
    
    // Right body
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius, size.height);
    
    // Bottom
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    
    // Left body
    path.lineTo(0, neckHeight * 2);
    
    // Left shoulder
    path.quadraticBezierTo(0, neckHeight * 1.5, size.width / 2 - neckWidth / 2, neckHeight);
    
    // Left neck
    path.lineTo(size.width / 2 - neckWidth / 2, 0);
    path.close();

    // Draw background bottle outline
    canvas.drawPath(path, paint);

    // Calculate fill based on progress
    if (progress > 0) {
      final fillHeight = size.height * progress;
      final yOffset = size.height - fillHeight;

      final wavePath = Path();
      wavePath.moveTo(0, size.height);
      wavePath.lineTo(size.width, size.height);
      wavePath.lineTo(size.width, yOffset);

      // Draw very subtle wave
      final waveAmplitude = 4.0;
      for (double x = size.width; x >= 0; x--) {
        final normalizedX = x / size.width;
        final waveY = yOffset + math.sin(normalizedX * math.pi * 2 + wavePhase) * waveAmplitude;
        wavePath.lineTo(x, waveY);
      }
      wavePath.lineTo(0, size.height);

      // Intersect wave with bottle
      final fillArea = Path.combine(PathOperation.intersect, path, wavePath);
      canvas.drawPath(fillArea, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BottlePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.wavePhase != wavePhase;
  }
}
