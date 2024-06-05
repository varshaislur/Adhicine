
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  IconData? suffixIcon;
  final bool isobscure;
  final String name;
  TextEditingController controller=TextEditingController();
  CustomTextField({super.key,required this.icon,required this.controller,this.suffixIcon,required this.isobscure,required this.name});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(

          decoration: InputDecoration(
            icon: Icon(widget.icon,color: Colors.cyan,),
            hintText: "${widget.name}"
          
          ),
          controller: widget.controller,
          obscureText: widget.isobscure,
        ),
      ),
    );
  }
}
