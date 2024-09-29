import 'package:flutter/material.dart';

class MemberEventsScreen extends StatefulWidget {
  @override
  _MemberEventsScreenState createState() => _MemberEventsScreenState();
}

class _MemberEventsScreenState extends State<MemberEventsScreen> {
  final List<Map<String, String>> _events = [];

  void _addEvent(String name, String date, String time) {
    setState(() {
      _events.add({'name': name, 'date': date, 'time': time});
    });
  }

  void _editEvent(int index, String name, String date, String time) {
    setState(() {
      _events[index] = {'name': name, 'date': date, 'time': time};
    });
  }

  void _showAddEventDialog() {
    String eventName = '';
    String eventDate = '';
    String eventTime = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Event Name'),
                onChanged: (value) {
                  eventName = value;
                },
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'Event Date (e.g., 2023-10-01)'),
                onChanged: (value) {
                  eventDate = value;
                },
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: 'Event Time (e.g., 10:00 AM)'),
                onChanged: (value) {
                  eventTime = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (eventName.isNotEmpty &&
                    eventDate.isNotEmpty &&
                    eventTime.isNotEmpty) {
                  _addEvent(eventName, eventDate, eventTime);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditEventDialog(int index) {
    String eventName = _events[index]['name']!;
    String eventDate = _events[index]['date']!;
    String eventTime = _events[index]['time']!;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Event Name'),
                controller: TextEditingController(text: eventName),
                onChanged: (value) {
                  eventName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Event Date'),
                controller: TextEditingController(text: eventDate),
                onChanged: (value) {
                  eventDate = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Event Time'),
                controller: TextEditingController(text: eventTime),
                onChanged: (value) {
                  eventTime = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (eventName.isNotEmpty &&
                    eventDate.isNotEmpty &&
                    eventTime.isNotEmpty) {
                  _editEvent(index, eventName, eventDate, eventTime);
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _showAddEventDialog,
              child: Text('Add Event'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_events[index]['name']!),
                      subtitle: Text(
                          '${_events[index]['date']} at ${_events[index]['time']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showEditEventDialog(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MemberEventsScreen(),
    ),
  );
}
