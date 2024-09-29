import 'package:flutter/material.dart';
import 'package:iith_app/screens/calender.dart';
import 'package:iith_app/screens/previous_events.dart';
import 'package:iith_app/screens/profile.dart';
import 'package:iith_app/screens/user/promotions.dart'; // Ensure to import your Profile screen

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person), // You can use any icon you prefer
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Navigate to the profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            _buildNavigationButton(
              context,
              title: 'Previous Events',
              screen: PreviousEventsScreen(),
            ),
            SizedBox(height: 16),
            _buildNavigationButton(
              context,
              title: 'Promote',
              screen: PromotionsPage(),
            ),
            SizedBox(height: 16),
            _buildNavigationButton(
              context,
              title: 'Event Calendar',
              screen: CalendarScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, {required String title, required Widget screen}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: UserHomeScreen(),
      routes: {
        '/profile': (context) => ProfilePage(), // Ensure you have a ProfileScreen defined
      },
    ),
  );
}
