import 'package:flutter/material.dart';
import '../theme/app_layout.dart';
import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppLayout.gap16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppTheme.secondaryText,
        ),
      ),
    );
  }
}
