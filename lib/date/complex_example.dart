// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class TableComplexExample extends StatefulWidget {
  @override
  _TableComplexExampleState createState() => _TableComplexExampleState();
}

class _TableComplexExampleState extends State<TableComplexExample> {
  PageController _pageController;
  ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  bool get canClearSelection => _selectedDays.isNotEmpty;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        if(selectedDay.month == focusedDay.month)
        _selectedDays.add(selectedDay);
      }
      _focusedDay.value = focusedDay;
    });
    _selectedDays.forEach((element) {
      print("aaaa ${element.day}");
    });
    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Complex'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<DateTime>(
            valueListenable: _focusedDay,
            builder: (context, value, _) {
              return _CalendarHeader(
                focusedDay: value,
                clearButtonVisible: canClearSelection,
                onTodayButtonTap: () {
                  setState(() => _focusedDay.value = DateTime.now());
                },
                onClearButtonTap: () {
                  setState(() {
                    _selectedDays.clear();
                    _selectedEvents.value = [];
                  });
                },
                onLeftArrowTap: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                onRightArrowTap: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
              );
            },
          ),
          // TableCalendar<Event>(
          //   firstDay: kFirstDay,
          //   lastDay: kLastDay,
          //   locale: "zh_CH",
          //   daysOfWeekHeight: 20,
          //   rowHeight: 60,
          //   focusedDay: _focusedDay.value,
          //   headerVisible: false,
          //   selectedDayPredicate: (day) => _selectedDays.contains(day),
          //   calendarFormat: _calendarFormat,
          //   // eventLoader: _getEventsForDay,
          //   /*  holidayPredicate: (day) {
          //     // Every 20th day of the month will be treated as a holiday
          //     return day.day == 20;
          //   },*/
          //   onDaySelected: _onDaySelected,
          //   calendarStyle: CalendarStyle(
          //     // Use `CalendarStyle` to customize the UI
          //     outsideDaysVisible: false,
          //     selectedDecoration: const BoxDecoration(
          //       color: const Color(0xFF6699FF),
          //       shape: BoxShape.circle,
          //     ),
          //     todayDecoration:  const BoxDecoration(
          //       color: const Color(0xFFFFFFF),
          //       shape: BoxShape.circle,
          //     ),
          //     todayTextStyle: const TextStyle(color: const Color(0xFF5A5A5A)),
          //   ),
          //   availableCalendarFormats: const {
          //     CalendarFormat.month: 'Month',
          //     // CalendarFormat.twoWeeks: '2 weeks',
          //     // CalendarFormat.week: 'Week',
          //   },
          //   onCalendarCreated: (controller) => _pageController = controller,
          //   onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          //   onFormatChanged: (format) {
          //     if (_calendarFormat != format) {
          //       setState(() => _calendarFormat = format);
          //     }
          //   },
          // ),
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            locale: "zh_CH",
            daysOfWeekHeight: 20,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            calendarFormat: _calendarFormat,
            // eventLoader: _getEventsForDay,
            // holidayPredicate: (day) {
            //   // Every 20th day of the month will be treated as a holiday
            //   return day.day == 20;
            // },
              calendarStyle: CalendarStyle(
                // Use `CalendarStyle` to customize the UI
                outsideDaysVisible: true,
                selectedDecoration: const BoxDecoration(
                  color: const Color(0xFF6699FF),
                  shape: BoxShape.circle,
                ),
                todayDecoration:  const BoxDecoration(
                  color: const Color(0xFFFFFFF),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(color: const Color(0xFF5A5A5A)),
              ),
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                // CalendarFormat.twoWeeks: '2 weeks',
                // CalendarFormat.week: 'Week',
              },
            onDaySelected: _onDaySelected,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key key,
    @required this.focusedDay,
    @required this.onLeftArrowTap,
    @required this.onRightArrowTap,
    @required this.onTodayButtonTap,
    @required this.onClearButtonTap,
    @required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat('yMMM', 'zh_CH')
        .format(focusedDay); //DateFormat.yMMM().format(focusedDay);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            width: 120.0,
            child: Text(
              headerText,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, size: 20.0),
            visualDensity: VisualDensity.compact,
            onPressed: onTodayButtonTap,
          ),
          if (clearButtonVisible)
            IconButton(
              icon: Icon(Icons.clear, size: 20.0),
              visualDensity: VisualDensity.compact,
              onPressed: onClearButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
