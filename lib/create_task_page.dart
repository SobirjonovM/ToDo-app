import 'package:flutter/material.dart';

import 'models/task.dart';

class CreateTaskPage extends StatefulWidget {
  final Task? taskToEdit; // Add this line
  final Function(Task?) onTaskCreated;

  CreateTaskPage({required this.onTaskCreated, this.taskToEdit});

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();

    // Populate fields with existing task details if editing
    if (widget.taskToEdit != null) {
      titleController.text = widget.taskToEdit!.name;
      descriptionController.text = widget.taskToEdit!.description;
      selectedDate = widget.taskToEdit!.dateTime;
      selectedTime = TimeOfDay.fromDateTime(widget.taskToEdit!.dateTime);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Task',
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
              'Task Title',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: titleController,
              style: TextStyle(fontFamily: 'InterestingFont', fontSize: 16.0),
              decoration: InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Task Description',
              style: TextStyle(
                fontFamily: 'InterestingFont',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: descriptionController,
              style: TextStyle(fontFamily: 'InterestingFont', fontSize: 16.0),
              decoration: InputDecoration(
                hintText: 'Enter task description',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date',
                      style: TextStyle(
                          fontFamily: 'InterestingFont', fontSize: 16.0)),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select Time',
                      style: TextStyle(
                          fontFamily: 'InterestingFont', fontSize: 16.0)),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Task? newTask = Task(
                  titleController.text,
                  DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ),
                  descriptionController.text,
                );

                widget.onTaskCreated(newTask);

                Navigator.pop(context); // Close the CreateTaskPage
              },
              child: Text('Submit Task',
                  style:
                      TextStyle(fontFamily: 'InterestingFont', fontSize: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}

// class Task {
//   String name;
//   DateTime dateTime;
//   String description;

//   Task(this.name, this.dateTime, this.description);
// }
