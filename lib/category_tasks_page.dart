import 'package:flutter/material.dart';
import 'package:todo_app/settings_page.dart';
import 'create_task_page.dart';
import 'daily_tasks_page.dart';
import 'home_page.dart';
import 'models/task.dart'; // Replace 'your_project_name' with your actual project name

class CategoryTasksPage extends StatefulWidget {
  final String categoryTitle;

  CategoryTasksPage({required this.categoryTitle});

  @override
  _CategoryTasksPageState createState() => _CategoryTasksPageState();
}

class _CategoryTasksPageState extends State<CategoryTasksPage> {
  List<Task> tasks = []; // Initialize with an empty list of tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryTitle,
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
            Text(
              'Tasks',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index].hashCode.toString()),
                    onDismissed: (direction) {
                      // Remove the dismissed task from the list
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                    ),
                    child: Card(
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
                                  fontFamily: 'InterestingFont',
                                  fontSize: 14.0),
                            ),
                            Text(
                              'Date: ${tasks[index].date}',
                              style: TextStyle(
                                  fontFamily: 'InterestingFont',
                                  fontSize: 14.0),
                            ),
                            Text(
                              'Description: ${tasks[index].description}',
                              style: TextStyle(
                                  fontFamily: 'InterestingFont',
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                        trailing: Checkbox(
                          value: tasks[index].isCompleted,
                          onChanged: (value) {
                            setState(() {
                              tasks[index].isCompleted = value ?? false;
                            });
                          },
                        ),
                        onTap: () {
                          _editTask(index);
                        },
                      ),
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
          _navigateToCreateTaskPage();
        },
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  // Helper function to navigate to CreateTaskPage
  void _navigateToCreateTaskPage() async {
    Task? newTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskPage(onTaskCreated: (Task? newTask) {
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        }),
      ),
    );

    // Handle the newTask here if needed
  }

  // Helper function to edit a task
  void _editTask(int index) async {
    Task? editedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskPage(
          onTaskCreated: (Task? editedTask) {
            if (editedTask != null) {
              setState(() {
                tasks[index] = editedTask;
              });
            }
          },
          taskToEdit: tasks[index],
        ),
      ),
    );

    // Handle the editedTask here if needed
  }
}
