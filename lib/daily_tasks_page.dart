import 'package:flutter/material.dart';
import 'package:todo_app/settings_page.dart';
import 'create_task_page.dart';
import 'home_page.dart';
import 'models/task.dart';

class DailyTasksPage extends StatefulWidget {
  @override
  _DailyTasksPageState createState() => _DailyTasksPageState();
}

class _DailyTasksPageState extends State<DailyTasksPage> {
  List<Task> tasks = [
    Task('Task 1', DateTime.now(), 'Description 1'),
    Task('Task 2', DateTime.now(), 'Description 2'),
    Task('Task 3', DateTime.now(), 'Description 3'),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Tasks',
          style: TextStyle(
            fontFamily: 'InterestingFont',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue, // Set the app bar color
      ),
      body: Container(
        color: Colors.lightBlue[50], // Set the background color of the page
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    child: ListTile(
                      title: Text(
                        tasks[index].name,
                        style: TextStyle(
                            fontFamily: 'InterestingFont', fontSize: 16.0),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time: ${tasks[index].time}',
                            style: TextStyle(
                                fontFamily: 'InterestingFont', fontSize: 14.0),
                          ),
                          Text(
                            'Date: ${tasks[index].date}',
                            style: TextStyle(
                                fontFamily: 'InterestingFont', fontSize: 14.0),
                          ),
                          Text(
                            'Description: ${tasks[index].description}',
                            style: TextStyle(
                                fontFamily: 'InterestingFont', fontSize: 14.0),
                          ),
                        ],
                      ),
                      // Other task details can be displayed here
                      // Add more interactivity if needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(
                onTaskCreated: (Task? newTask) {
                  if (newTask != null) {
                    setState(() {
                      tasks.add(newTask);
                    });
                  }
                },
              ),
            ),
          );
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
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
