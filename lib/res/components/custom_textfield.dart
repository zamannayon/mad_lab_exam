import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final Color textColor;
  final Color borderColor;
  final Color inputColor;

  final TextEditingController;
  final TextController;

  const CustomTextfield(
      {super.key,
      required this.hint,
      this.TextEditingController,
      this.TextController,
      this.textColor = Colors.black,
      this.borderColor = Colors.black,
      this.inputColor = Colors.black});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.TextController,
      style: TextStyle(color: widget.inputColor),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: widget.textColor,
          )),
    );
  }
}
