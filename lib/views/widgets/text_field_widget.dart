// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// TextFieldWidget: StatelessWidget Class
class TextFieldWidget extends StatelessWidget {
  // Final: Parameters
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String label;
  final String hint;

  // Constructor
  const TextFieldWidget({
    required this.controller,
    required this.keyboardType,
    required this.readOnly,
    required this.label,
    required this.hint,
    super.key,
  });

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widget
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        validator: (String? inputText) {
          if (inputText!.trim().toString().isEmpty) {
            return "Please fill the input field.";
          }
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
