import 'package:flutter/material.dart';

// Helper for consistent key-value row layout
class FormRowLayout extends StatelessWidget {
  final String label;
  final Widget child;

  const FormRowLayout({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}

// Reusable styled input decoration
InputDecoration customInputDecoration(String hint, {Widget? suffixIcon}) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.grey.shade200,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 11),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide.none,
    ),
    suffixIcon: suffixIcon,
  );
}