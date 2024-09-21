import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const CustomButton({
    required this.buttonText,
    required this.onTap,
    required Color color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Adjust width as per your requirement
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(buttonText), // Display buttonText as the child
      ),
    );
  }
}
