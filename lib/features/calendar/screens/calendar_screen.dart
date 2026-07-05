import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/reminder_provider.dart';
import '../../../core/database/models/reminder_model.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remindersState = ref.watch(activeRemindersProvider);

    List<ReminderModel> allReminders = [];
    if (remindersState is AsyncData) {
      allReminders = remindersState.value ?? [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('MMMM yyyy').format(_currentMonth),
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 32),
            onPressed: _prevMonth,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 32),
            onPressed: _nextMonth,
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildDaysOfWeek(theme),
            const SizedBox(height: 8),
            Expanded(
              child: _buildCalendarGrid(theme, allReminders),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaysOfWeek(ThemeData theme) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((d) {
          final isWeekend = d == 'Sat' || d == 'Sun';
          return Expanded(
            child: Center(
              child: Text(
                d,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isWeekend ? Colors.white54 : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid(ThemeData theme, List<ReminderModel> reminders) {
    // Calculate days in month and starting weekday (1 = Monday)
    final daysInMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    final firstDayWeekday = _currentMonth.weekday; 

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1.0,
      ),
      itemCount: daysInMonth + firstDayWeekday - 1,
      itemBuilder: (context, index) {
        if (index < firstDayWeekday - 1) {
          return const SizedBox.shrink(); // Empty slot
        }

        final day = index - (firstDayWeekday - 1) + 1;
        final date = DateTime(_currentMonth.year, _currentMonth.month, day);
        final isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
        final isToday = _isSameDay(date, DateTime.now());
        final isSelected = _isSameDay(date, _selectedDate);

        // Find reminders for this date
        final dayReminders = reminders.where((r) => _isSameDay(r.date, date)).toList();

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
            _showDayBottomSheet(context, ref, theme, date, dayReminders);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected 
                  ? Colors.white 
                  : (isWeekend ? Colors.white.withOpacity(0.1) : Colors.transparent),
              border: isToday && !isSelected 
                  ? Border.all(color: Colors.white, width: 2) 
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '\$day',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: isSelected || isToday ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                if (dayReminders.isNotEmpty)
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: Text(
                      dayReminders.length > 1 ? '+\${dayReminders.length}' : dayReminders.first.emoji,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _showDayBottomSheet(BuildContext context, WidgetRef ref, ThemeData theme, DateTime date, List<ReminderModel> reminders) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF151515), // Very dark gray, premium
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE, MMM d').format(date),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded, color: Colors.white54),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: reminders.isEmpty
                        ? Center(
                            child: Text(
                              'No reminders for this day',
                              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white54),
                            ),
                          )
                        : ListView.separated(
                            controller: scrollController,
                            itemCount: reminders.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final r = reminders[index];
                              return _buildReminderCard(theme, r);
                            },
                          ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      _showAddReminderSheet(context, ref, theme, date);
                    },
                    icon: const Icon(Icons.add_rounded),
                    label: const Text('Add Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildReminderCard(ThemeData theme, ReminderModel r) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF222222),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Text(r.emoji, style: const TextStyle(fontSize: 24)),
        title: Text(r.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
        subtitle: Text('\${r.time} • \${r.notificationType}', style: theme.textTheme.labelMedium?.copyWith(color: Colors.white54)),
        trailing: const Icon(Icons.chevron_right_rounded, color: Colors.white30),
        onTap: () {
          // Future: Edit logic
        },
      ),
    );
  }

  void _showAddReminderSheet(BuildContext context, WidgetRef ref, ThemeData theme, DateTime defaultDate) {
    final titleController = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF151515),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24,
            right: 24,
            top: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('New Reminder', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 24),
              TextField(
                controller: titleController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'What do you need to do?',
                  hintStyle: const TextStyle(color: Colors.white30),
                  filled: true,
                  fillColor: const Color(0xFF222222),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {
                  if (titleController.text.trim().isEmpty) return;
                  
                  final newReminder = ReminderModel()
                    ..title = titleController.text.trim()
                    ..date = defaultDate
                    ..time = DateFormat('hh:mm a').format(DateTime.now())
                    ..emoji = '📌'
                    ..category = 'Personal'
                    ..priority = 'Medium'
                    ..notificationType = 'Notification';
                    
                  ref.read(addReminderProvider)(newReminder);
                  Navigator.pop(context);
                },
                child: const Text('Save Reminder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
}
