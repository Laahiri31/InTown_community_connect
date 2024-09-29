import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Add your image path here
            ),
            SizedBox(height: 20),
            // Name
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Email
            Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Divider(thickness: 2),
            SizedBox(height: 20),
            // Graphs (Bar chart and Line chart side by side)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Bar Chart
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        barGroups: [
                          BarChartGroupData(x: 0, barRods: [
                            BarChartRodData(y: 8, colors: [Colors.blue])
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(y: 10, colors: [Colors.green])
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(y: 14, colors: [Colors.red])
                          ]),
                        ],
                      ),
                    ),
                  ),
                  // Line Chart
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(show: true),
                        borderData: FlBorderData(show: true),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(1, 2),
                              FlSpot(2, 5),
                              FlSpot(3, 3.1),
                              FlSpot(4, 4),
                            ],
                            isCurved: true,
                            colors: [Colors.purple],
                            dotData: FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Divider(thickness: 2),
            SizedBox(height: 20),
            // Rewards Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rewards',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Points Earned: 350',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Level: Gold',
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}