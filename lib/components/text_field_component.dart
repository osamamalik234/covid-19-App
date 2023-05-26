import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final IconData? suffixIcon;
  final TextEditingController controller;
  const TextFieldComponent(
      {Key? key,
      required this.labelText,
      required this.iconData,
      this.suffixIcon,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.yellowAccent,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.yellow, fontSize: 18),
        prefixIcon: Icon(
          iconData,
          color: Colors.yellow,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.yellow,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
        ),
      ),
    );
  }
}
