import 'dart:math'; // For bubble rotation

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iith_app/widgets/app_button_widget.dart';
import 'package:iith_app/widgets/app_input_text_field.dart';
import 'package:iith_app/widgets/googleSignup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(201, 0, 0, 0),
              fontFamily: 'Roboto',
              letterSpacing: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white, // Matches splash screen background
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushNamed('/splash');
          },
        ),
        elevation: 0, // Removes shadow for clean look
      ),
      body: Stack(
        children: [
          // Adding the bubble images to match the splash screen design
          Positioned(
            top: 0,
            left: 0,
            child: rotatedBubbleImage(angle: pi / 4),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: rotatedBubbleImage(angle: -pi / 4),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: rotatedBubbleImage(angle: pi / 6),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: rotatedBubbleImage(angle: -pi / 6),
          ),
          // Form content of the sign-in page
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GoogleSignUpButton(
                      onPressed: () {
                        print('Google sign-in pressed');
                      },
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "--------------------------------------Sign in with Email--------------------------------------",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppInputTextFieldWidget(
                      controller: _namecontroller,
                      hintText: 'User Name',
                      obscureText: false,
                      prefixIcon: Icons.person,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@._-]'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppInputTextFieldWidget(
                      controller: _passwordcontroller,
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/forgotpassword');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    AppbuttonWidget(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/userOrMember');
                      },
                      title: "Sign in",
                      titleColor: const Color(0xFF1C3146),
                      backgroundColor:
                          const Color.fromARGB(255,230,160,211), // Matches splash screen button
                      borderColor: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(
                                color: Color.fromARGB(255,230,160,211),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
        'images/bubbles.png', // Path to your bubble image
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    ),
  );
}
