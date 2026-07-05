import 'package:flutter/material.dart';
import '../theme/app_layout.dart';
import '../theme/app_theme.dart';
import 'animated_card.dart';

class EmptyStateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const EmptyStateCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: AppLayout.padH),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppTheme.disabledText),
            const SizedBox(height: AppLayout.gap16),
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(color: AppTheme.secondaryText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.disabledText),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
