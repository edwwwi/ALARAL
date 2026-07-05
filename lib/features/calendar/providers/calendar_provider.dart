import 'package:flutter_riverpod/flutter_riverpod.dart';

enum EventStatus { pending, completed }

class CalendarEvent {
  final String id;
  final String title;
  final DateTime date;
  final String emoji;
  final String category;
  final EventStatus status;

  CalendarEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.emoji,
    required this.category,
    required this.status,
  });

  CalendarEvent copyWith({EventStatus? status}) {
    return CalendarEvent(
      id: id,
      title: title,
      date: date,
      emoji: emoji,
      category: category,
      status: status ?? this.status,
    );
  }
}

class CalendarState {
  final DateTime selectedDate;
  final DateTime displayedMonth;
  final List<CalendarEvent> events;

  CalendarState({
    required this.selectedDate,
    required this.displayedMonth,
    required this.events,
  });

  CalendarState copyWith({
    DateTime? selectedDate,
    DateTime? displayedMonth,
    List<CalendarEvent>? events,
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      displayedMonth: displayedMonth ?? this.displayedMonth,
      events: events ?? this.events,
    );
  }
}

class CalendarNotifier extends StateNotifier<CalendarState> {
  CalendarNotifier()
      : super(CalendarState(
          selectedDate: DateTime.now(),
          displayedMonth: DateTime(DateTime.now().year, DateTime.now().month),
          events: _generateMockEvents(),
        ));

  static List<CalendarEvent> _generateMockEvents() {
    final now = DateTime.now();
    return [
      CalendarEvent(
        id: '1',
        title: 'Morning Workout',
        date: DateTime(now.year, now.month, now.day, 6, 30),
        emoji: '🏋️‍♂️',
        category: 'Health',
        status: EventStatus.completed,
      ),
      CalendarEvent(
        id: '2',
        title: 'Client Meeting',
        date: DateTime(now.year, now.month, now.day, 9, 30),
        emoji: '💼',
        category: 'Work',
        status: EventStatus.pending,
      ),
      CalendarEvent(
        id: '3',
        title: 'Drink Water',
        date: DateTime(now.year, now.month, now.day, 12, 0),
        emoji: '💧',
        category: 'Health',
        status: EventStatus.pending,
      ),
      CalendarEvent(
        id: '4',
        title: 'Mom\'s Birthday',
        date: DateTime(now.year, now.month, now.day + 1, 0, 0),
        emoji: '🎂',
        category: 'Personal',
        status: EventStatus.pending,
      ),
      CalendarEvent(
        id: '5',
        title: 'Flight to NYC',
        date: DateTime(now.year, now.month, now.day + 3, 15, 0),
        emoji: '✈️',
        category: 'Travel',
        status: EventStatus.pending,
      ),
    ];
  }

  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void updateDisplayedMonth(DateTime month) {
    state = state.copyWith(displayedMonth: month);
  }

  void toggleEventStatus(String id) {
    final newEvents = state.events.map((e) {
      if (e.id == id) {
        return e.copyWith(
          status: e.status == EventStatus.pending ? EventStatus.completed : EventStatus.pending,
        );
      }
      return e;
    }).toList();
    state = state.copyWith(events: newEvents);
  }

  void deleteEvent(String id) {
    state = state.copyWith(
      events: state.events.where((e) => e.id != id).toList(),
    );
  }

  List<CalendarEvent> getEventsForDate(DateTime date) {
    return state.events.where((e) => _isSameDay(e.date, date)).toList();
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}

final calendarProvider = StateNotifierProvider<CalendarNotifier, CalendarState>((ref) {
  return CalendarNotifier();
});
