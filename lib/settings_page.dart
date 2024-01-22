import 'package:flutter/material.dart';

import 'daily_tasks_page.dart';
import 'home_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'InterestingFont',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            SwitchListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontFamily: 'InterestingFont',
                  fontSize: 16.0,
                ),
              ),
              value: false, // Set the value based on your dark mode state
              onChanged: (bool value) {
                // Handle the switch change event
                // You can implement dark mode logic here
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Account Settings',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontFamily: 'InterestingFont',
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                // Navigate to change password page
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'InterestingFont',
                  fontSize: 16.0,
                ),
              ),
              onTap: () {
                // Handle logout logic
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to Home Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.assignment),
              onPressed: () {
                // Navigate to Daily Tasks Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailyTasksPage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to Settings Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
