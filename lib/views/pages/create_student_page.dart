// Dart: Existing Libraries
import 'dart:math';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Models
import '../../models/student_model.dart';

// Controllers
import '../../controllers/student_controller.dart';

// Widgets
import '../widgets/text_field_widget.dart';

// CreateStudentPage: StatelessWidget Class
class CreateStudentPage extends StatelessWidget {
  // Constructor
  CreateStudentPage({super.key});

  // Final: Class Properties
  final String title = "Create New Student";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();

  // Action: Class Methods
  void _onCreateNewStudent(BuildContext context) {
    final StudentController studentController = Provider.of<StudentController>(
      context,
      listen: false,
    );
    if (_formKey.currentState!.validate()) {
      final String name = _studentNameController.text.toString();
      final int age = int.parse(_ageController.text.toString());
      final String address = _addressController.text.toString();
      final String rollNumber = _rollNoController.text.toString();
      final StudentModel newStudent = StudentModel(
        id: Random().nextInt(100000) + 1,
        name: name,
        age: age,
        address: address,
        rollNumber: rollNumber,
      );
      studentController.addNewStudent(newStudent);

      const SnackBar snackBar = SnackBar(
        content: Text(
          'Created new student successfully!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: (Colors.grey),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context).pop();
    }
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20.0),
              TextFieldWidget(
                controller: _studentNameController,
                keyboardType: TextInputType.text,
                readOnly: false,
                label: "Name",
                hint: "Enter student name",
              ),
              TextFieldWidget(
                controller: _ageController,
                keyboardType: TextInputType.number,
                readOnly: false,
                label: "Age",
                hint: "Enter student age",
              ),
              TextFieldWidget(
                controller: _addressController,
                keyboardType: TextInputType.streetAddress,
                readOnly: false,
                label: "Address",
                hint: "Enter student address",
              ),
              TextFieldWidget(
                controller: _rollNoController,
                keyboardType: TextInputType.text,
                readOnly: false,
                label: "Roll Number",
                hint: "Enter student roll number",
              ),
              const SizedBox(height: 50.0),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                  onPressed: () => _onCreateNewStudent(context),
                  child: const Text("Create Student"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
