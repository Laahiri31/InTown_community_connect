import 'package:flutter/material.dart';
import 'package:iith_app/screens/member/member_edit.dart';
import 'package:iith_app/screens/member/member_event.dart';

class MemberHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person), // You can use any icon you prefer
            onPressed: () {
              Navigator.pushNamed(
                  context, '/profile'); // Navigate to the profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Events Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Events Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MemberEventsScreen()),
                  ),
                );
              },
              child: Text('Events'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Edit Members Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Edit Members Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberEditScreen(),
                  ),
                );
              },
              child: Text('Edit Members'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),

            // Utilities Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Utilities Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UtilitiesPage(),
                  ),
                );
              },
              child: Text('Utilities'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for Events Page
class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Center(
        child: Text('Events Page'),
      ),
    );
  }
}

// Placeholder for Members Page
class MembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
      body: Center(
        child: Text('Members Page'),
      ),
    );
  }
}

// Placeholder for Utilities Page
class UtilitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilities'),
      ),
      body: Center(
        child: Text('Utilities Page'),
      ),
    );
  }
}
