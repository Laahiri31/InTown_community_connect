import 'package:flutter/material.dart';
import 'package:iith_app/screens/calender.dart';
import 'package:iith_app/screens/member/member_add.dart';
import 'package:iith_app/screens/member/member_edit.dart';
import 'package:iith_app/screens/member/member_home.dart';
import 'package:iith_app/screens/notifications.dart';
import 'package:iith_app/screens/previous_events.dart';
import 'package:iith_app/screens/profile.dart';
import 'package:iith_app/screens/signin.dart';
import 'package:iith_app/screens/signup.dart';
import 'package:iith_app/screens/splash.dart';
import 'package:iith_app/screens/toggle.dart';
import 'package:iith_app/screens/user/promotions.dart';
import 'package:iith_app/screens/user/user_home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/splash' :(context) =>  SplashScreen(),
        '/signin' :(context) => SignIn(),
        '/signup' :(context) => SignUp(),
        '/userOrMember': (context) => UserOrMemberPage(),
        '/profile' :(context) => ProfilePage(),
        '/promotions' :(context) => PromotionsPage(),
        '/calender' :(context) => CalendarScreen(),
        '/memberadd' :(context) => AddMemberScreen(),
        '/notifications' :(context) => NotificationsPage(),
        '/memberedit' :(context) => MemberEditScreen(),
        '/member_home' :(context) => MemberHomePage(),
        '/previous_events' :(context) => PreviousEventsScreen(),
        '/user_home':(context) => UserHomeScreen(),
      },
    initialRoute: '/splash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
