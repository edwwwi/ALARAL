import 'package:flutter/material.dart';
import '../../../../core/theme/app_layout.dart';
import '../../../../core/theme/app_theme.dart';

class SaveAlarmButton extends StatefulWidget {
  const SaveAlarmButton({super.key});

  @override
  State<SaveAlarmButton> createState() => _SaveAlarmButtonState();
}

class _SaveAlarmButtonState extends State<SaveAlarmButton> {
  bool _isSaving = false;
  bool _isSuccess = false;

  void _handleSave() async {
    setState(() {
      _isSaving = true;
    });

    // Mock network/db delay
    await Future.delayed(const Duration(milliseconds: 600));

    setState(() {
      _isSaving = false;
      _isSuccess = true;
    });

    // Mock close page
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (_isSaving || _isSuccess) ? null : _handleSave,
      child: AnimatedContainer(
        duration: AppLayout.animDuration,
        curve: AppLayout.animCurve,
        width: _isSuccess ? 60 : double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: _isSuccess ? AppTheme.success : AppTheme.primaryText,
          borderRadius: _isSuccess ? BorderRadius.circular(30) : AppLayout.borderL,
          boxShadow: [
            BoxShadow(
              color: (_isSuccess ? AppTheme.success : AppTheme.primaryText).withOpacity(0.2),
              blurRadius: 16,
              offset: const Offset(0, 8),
            )
          ],
        ),
        alignment: Alignment.center,
        child: _isSuccess
            ? const Icon(Icons.check_rounded, color: Colors.black, size: 32)
            : _isSaving
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Save Alarm',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
      ),
    );
  }
}
