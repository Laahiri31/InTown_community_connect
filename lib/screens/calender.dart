import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Map to store event data.
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 10, 24): ['Dussehra Celebration'],
    DateTime.utc(2023, 11, 12): ['Diwali Festival'],
    DateTime.utc(2023, 12, 25): ['Christmas Gathering'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              markersAlignment: Alignment.bottomCenter,
              outsideDaysVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildEventCard(
                  'Dussehra Celebration',
                  ' images/dushera.png  ',
                  'October 24, 2023',
                ),
                _buildEventCard(
                  'Diwali Festival',
                  'images/diwali.png ',
                  'November 12, 2023',
                ),
                _buildEventCard(
                  'Christmas Gathering',
                  'images/christmas.png',
                  'December 25, 2023',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String eventName, String imagePath, String date) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(eventName),
        subtitle: Text(date),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: CalendarScreen(),
    ),
  );
}

//calendarStyle: CalendarStyle(
  //            markerDecoration: BoxDecoration(
    //            color: Colors.red,
      //          shape: BoxShape.circle,
        //      ),
          //  ),