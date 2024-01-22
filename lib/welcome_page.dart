import 'package:flutter/material.dart';
import 'home_page.dart';
import 'daily_tasks_page.dart';
import 'settings_page.dart';

class WelcomePage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String age;

  WelcomePage({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $firstName $lastName! You are $age years old.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Daily Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex:
            0, // Set the initial index, you can change this based on the selected page
        onTap: (index) {
          // Handle taps to navigate to the selected page
          switch (index) {
            case 0:
              // Navigate to Home Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
              break;
            case 1:
              // Navigate to Daily Tasks Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyTasksPage(),
                ),
              );
              break;
            case 2:
              // Navigate to Settings Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
