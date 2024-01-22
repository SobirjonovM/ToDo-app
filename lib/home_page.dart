import 'package:flutter/material.dart';
import 'package:todo_app/settings_page.dart';
import 'category_tasks_page.dart';
import 'daily_tasks_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'InterestingFont',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            CategoryCard(
              title: 'Work',
              color: Colors.blue,
            ),
            CategoryCard(
              title: 'Personal',
              color: Colors.green,
            ),
            CategoryCard(
              title: 'Study',
              color: Colors.orange,
            ),
            CategoryCard(
              title: 'Hobby',
              color: Colors.purple,
            ),
            CategoryCard(
              title: 'Entertainment',
              color: Colors.red,
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

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;

  CategoryCard({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: color,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'InterestingFont',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryTasksPage(categoryTitle: title),
            ),
          );
        },
      ),
    );
  }
}
