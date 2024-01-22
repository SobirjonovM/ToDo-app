import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the WelcomePage

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My ToDo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _navigateToWelcomePage();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToWelcomePage() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String age = _ageController.text;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePage(
          firstName: firstName,
          lastName: lastName,
          age: age,
        ),
      ),
    );
  }
}
