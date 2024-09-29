import 'package:flutter/material.dart';

class PreviousEventsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _pastEvents = [
    {
      'title': 'Dussehra Celebration',
      'date': 'October 24, 2023',
      'description':
          'A grand celebration of Dussehra with cultural events, music, and festive food.',
      'imagePath': 'images/dushera.png',  // Adjusted path if in assets/images/
    },
    {
      'title': 'Diwali Festival',
      'date': 'November 12, 2023',
      'description':
          'The festival of lights was celebrated with fireworks, traditional dances, and delicious sweets.',
      'imagePath': 'images/diwali.png',   // Adjusted path if in assets/images/
    },
    {
      'title': 'Christmas Gathering',
      'date': 'December 25, 2023',
      'description':
          'A joyful Christmas gathering with carols, gifts, and community activities.',
      'imagePath': 'images/christmas.png', // Adjusted path if in assets/images/
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Events'),
      ),
      body: ListView.builder(
        itemCount: _pastEvents.length,
        itemBuilder: (context, index) {
          final event = _pastEvents[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ExpansionTile(
              leading: Image.asset(
                event['imagePath'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(event['title']),
              subtitle: Text(event['date']),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['description'],
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        event['imagePath'],
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: PreviousEventsScreen(),
    ),
  );
}
