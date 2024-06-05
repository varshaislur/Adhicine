import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final IconData? suffixIcon;
  final bool isObscure;
  final String name;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Added validator

  CustomTextField({
    super.key,
    required this.icon,
    required this.controller,
    this.suffixIcon,
    required this.isObscure,
    required this.name,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Colors.cyan,
          ),
          hintText: widget.name,
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon)
              : null,
        ),
        controller: widget.controller,
        obscureText: widget.isObscure,
        validator: widget.validator,
      ),
    );
  }
}
