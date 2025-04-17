import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed; // Corrected type and name

  const ReuseableButton({
    required this.title,
    required this.onPressed, // Added this parameter
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Now uses the provided callback
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffF79E89),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
