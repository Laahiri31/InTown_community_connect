import 'dart:async';
import 'dart:math';  // For rotation

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Rotated bubbles using the image 'assets/images/bubbles.png'
          Positioned(
            top: 0,
            left: 0,
            child: rotatedBubbleImage(angle: pi / 4),  // 45-degree rotation
          ),
          Positioned(
            top: 0,
            right: 0,
            child: rotatedBubbleImage(angle: -pi / 4),  // -45-degree rotation
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: rotatedBubbleImage(angle: pi / 4),  // 30-degree rotation
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: rotatedBubbleImage(angle: -pi / 4),  // -30-degree rotation
          ),

          // Main content of the splash screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/group.png',  // Path to your group image
                  height: 300,
                ),
                SizedBox(height: 20),
                Text(
                  "InTown",  // App name
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Discover, Connect, Engage Locally",  // Tagline
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 40),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to load and rotate the bubble image
  Widget rotatedBubbleImage({double angle = 0}) {
    return Transform.rotate(
      angle: angle,
      child: Image.asset(
        'images/bubbles.png',  // Path to your bubble image
        width: 150,  // Adjust the width to your preferred size
        height: 150,  // Adjust the height to your preferred size
        
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),

  ));
}
